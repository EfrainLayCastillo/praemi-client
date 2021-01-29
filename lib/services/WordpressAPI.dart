import 'dart:developer';
import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

class WordpressAPI {
  static const String baseURL = "http://praemi.3.94.78.53.xip.io/wp-json";

  Future generateToken(data) async {
    return await http.post("$baseURL/jwt-auth/v1/token", body: data);
  }

  Future<bool> queryVerifyToken() async {
    dynamic sessionToken = await FlutterSession().get("tokens");

    var res = await http.post("$baseURL/jwt-auth/v1/token/validate", headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer ${sessionToken['token']}"
    });
    print(res.body);
    if (res.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(res.body);
      return jsonResponse["data"]["status"] == 200 ? true : false;
    } else {
      return false;
    }
  }

  Future<Map<String, dynamic>> queryGetUser() async {
    dynamic sessionToken = await FlutterSession().get("tokens");
    print(sessionToken["token"]);
    var res = await http.post("$baseURL/wp/v2/users/me", headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer ${sessionToken['token']}"
    });
    Map<String, dynamic> jsonResponse = json.decode(res.body);
    print(jsonResponse["username"]);
    return jsonResponse;
  }
}
