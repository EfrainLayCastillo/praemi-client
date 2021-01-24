import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/SimpleBlocObserver.dart';
import 'repositories/authentication_repository.dart';
import 'repositories/user_repository.dart';
import 'app.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}
