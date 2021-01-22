import 'dart:async';
import 'dart:developer';

import 'package:flutter_session/flutter_session.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final baseURL = "http://praemi.3.94.78.53.xip.io/wp-json";
  final _controller = StreamController<AuthenticationStatus>();
  static final SESSION = FlutterSession();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<dynamic> logIn({
    @required String username,
    @required String password,
  }) async {
    assert(username != null);
    assert(password != null);
    try {
      print('nombre: $username, password: $password');
      final body = {
        'username': username,
        'password': password,
      };
      var res = await http.post("$baseURL/jwt-auth/v1/token", body: body);
      print(res.body);
      await Future.delayed(
        const Duration(milliseconds: 300),
        () => _controller.add(AuthenticationStatus.authenticated),
      );

      return res?.body;
    } finally {}
  }

  static setToken(String token, String userEmail) async {
    _AuthData data = _AuthData(token, userEmail);
    return await SESSION.set('tokens', data);
  }

  static getToken() async {
    return await SESSION.get('tokens');
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}

class _AuthData {
  String token, userEmail;
  _AuthData(this.token, this.userEmail);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = token;
    data['user_email'] = userEmail;
    return data;
  }
}
