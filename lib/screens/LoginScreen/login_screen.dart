import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:praemiclient/repositories/user_repository.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;
  LoginPage({this.userRepository});
  static Route route(userRepository) {
    return MaterialPageRoute<void>(
        builder: (_) => LoginPage(userRepository: userRepository));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(userRepository: userRepository),
          child: LoginForm(),
        ),
      ),
    );
  }
}
