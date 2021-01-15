import 'package:flutter/material.dart';
import 'authentication_repository.dart';
import 'package:praemiclient/app.dart';
import 'package:flutter/widgets.dart';
import './user_repository.dart';

void main() {
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}
