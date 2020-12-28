
import 'package:Bloctale/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:Bloctale/src/blocs/authentication_bloc/authentication_state.dart';
import 'package:Bloctale/src/blocs/simple_bloc_observer.dart';
import 'package:Bloctale/src/repositories/user_repository.dart';
import 'package:Bloctale/src/screens/home_screen.dart';
import 'package:Bloctale/src/screens/login/login_screen.dart';
import 'package:Bloctale/src/blocs/authentication_bloc/authentication_event.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository,
      )..add(AuthenticationStarted()),
      child: MyApp(
        userRepository: userRepository,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  MyApp({UserRepository userRepository}) : _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc tale',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Color(0xFFFCFCFB),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationFailure) {
            return LoginScreen(userRepository: _userRepository,);
          }

          if (state is AuthenticationSuccess) {
            return HomeScreen(
              user: state.firebaseUser,
            );
          }

          return Scaffold(
            appBar: AppBar(),
            body: Container(
              child: Center(child: Text("Loading")),
            ),
          );
        },
      ),
    );
  }
}