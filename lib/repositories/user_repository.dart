import 'dart:async';

import 'package:meta/meta.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:praemiclient/services/WordpressAPI.dart';

import 'package:praemiclient/models/models.dart';

class UserRepository {
  WordpressAPI _query = WordpressAPI();
  static final SESSION = FlutterSession();

  // Enpoints

  Future<bool> verifyToken() async {
    return await _query.queryVerifyToken();
  }

  Future getUser() async {
    return await _query.queryGetUser();
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
      // final Map<String, dynamic> errorData = Map<String, dynamic>();

      var res = await _query.generateToken(body);

      if (res.statusCode == 200) {
        // _controller.add(AuthenticationStatus.authenticated);
        return res?.body;
      }
      return res?.body;
    } finally {}
  }

  static setToken(String token, String userEmail) async {
    _AuthData data = _AuthData(token, userEmail);
    await SESSION.set('tokens', data);
  }

  static Future<Map<String, dynamic>> getToken() async {
    return await SESSION.get('tokens');
  }

  void logOut() async {
    await SESSION.prefs.clear();
  }

  // Future<User> getUser() async {
  //   if (_user != null) return _user;
  //   var userData = await _query.getUser();
  //   print(userData);
  //   return Future.delayed(
  //     const Duration(milliseconds: 300),
  //     () => _user = User(Uuid().v4()),
  //   );
  // }
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
