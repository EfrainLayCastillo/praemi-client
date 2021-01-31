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

  Future<User> getUser() async {
    Map<String, dynamic> userData = await _query.queryGetUser();
    dynamic sessionToken = await FlutterSession().get("tokens");
    print(userData["roles"][0]);
    return User(
      idUser: userData["id"],
      username: userData["username"],
      email: userData["email"],
      roles: userData["roles"][0],
      tokenAuth: sessionToken["token"]
    );
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

      var res = await _query.generateToken(body);

      if (res.statusCode == 200) { return res?.body; }
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

  Future<void> logOut() async {
    await SESSION.set('tokens', 'empty');
  }

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
