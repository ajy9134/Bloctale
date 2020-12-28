import 'package:Bloctale/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Bloctale/src/blocs/authentication_bloc/authentication_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseUser user;

  const HomeScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
        title: Text('Bloc tale',
        style: TextStyle(
           fontSize: 20,
           fontFamily: 'Impact',
           color: Color(0xff723838),            
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.camera_alt,
            color: Color(0xff723838)
            ),
            onPressed: () {
              //카메라 실행
            },
          ),
        actions: <Widget>[
          FlatButton(
            textColor: Color(0xff723838),
            child: Text(
              'LogOut',
              style: TextStyle(fontSize: 14),
            ),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(AuthenticationLoggedOut());
            },
          )
        ],
      ),
      
      body: Column(
        children: <Widget>[
          Center(
            child: Text("Hello, ${user.email}"),
          ),
        ],
      ),
    );
  }
}