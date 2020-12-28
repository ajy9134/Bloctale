import 'package:Bloctale/src/blocs/register_bloc/register_bloc.dart';
import 'package:Bloctale/src/repositories/user_repository.dart';
import 'package:Bloctale/src/screens/register/register_form.dart';
import 'package:Bloctale/src/widgets/curved_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepository _userRepository;

  const RegisterScreen({Key key, UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Color(0xff723838),
        ),
      ),
      body: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(userRepository: _userRepository),
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                CurvedWidget(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(40),
                    width: double.infinity,
                    height: 380,
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Impact',
                        color: Color(0xff723838),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 220),
                  child: RegisterForm(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}