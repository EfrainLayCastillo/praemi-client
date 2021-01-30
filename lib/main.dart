import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/SimpleBlocObserver.dart';
import 'repositories/user_repository.dart';
import 'app.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();
  runApp(App(userRepository: userRepository));
}
