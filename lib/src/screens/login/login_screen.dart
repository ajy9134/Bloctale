import 'package:Bloctale/src/blocs/login_bloc/login_bloc.dart';
import 'package:Bloctale/src/repositories/user_repository.dart';
import 'package:Bloctale/src/screens/login/login_form.dart';
import 'package:Bloctale/src/widgets/curved_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  const LoginScreen({Key key, UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: _userRepository),
        
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
                      'Bloc tale',
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
                  child: LoginForm(userRepository: _userRepository,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}