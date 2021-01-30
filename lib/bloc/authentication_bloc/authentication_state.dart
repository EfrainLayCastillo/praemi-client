part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final User userModel;

  const Authenticated({this.userModel});

  Authenticated copyWith({User userModel}) {
    return Authenticated(userModel: userModel ?? this.userModel);
  }

  @override
  List<Object> get props => [userModel];

  @override
  String toString() => 'Authenticated { Usuario: ${userModel.email} }';
}

class Unauthenticated extends AuthenticationState {}
