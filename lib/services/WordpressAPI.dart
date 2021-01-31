import 'dart:developer';
import 'dart:convert';
import 'dart:math';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:praemiclient/models/models.dart';
import 'package:praemiclient/repositories/WooPraemi.dart';

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
    var res = await http.post("$baseURL/wp/v2/users/me", headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer ${sessionToken['token']}"
    });
    Map<String, dynamic> jsonResponse = json.decode(res.body);
    print(jsonResponse["username"]);
    return jsonResponse;
  }

  Future<Map<String, dynamic>> queryGetUserByToken(String authToken) async {
    var res = await http.post("$baseURL/wp/v2/users/me", headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer $authToken"
    });

    if (res.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(res.body);
      print(jsonResponse);
      return jsonResponse;
    } else {
      return throw Exception();
    }
  }

  Future<Map<String, dynamic>> queryMakeOrder(
      {User userData, int productID}) async {
    Random rand = Random();
    List<int> codeUnits = List.generate(10, (index) {
      return rand.nextInt(26) + 97;
    });
    String nonce = String.fromCharCodes(codeUnits);
    int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    dynamic sessionToken = await FlutterSession().get("tokens");
    String parameters = "oauth_consumer_key=" +
        WooPraemi.consumerKeyConst +
        "&oauth_nonce=" +
        nonce +
        "&oauth_signature_method=HMAC-SHA1&oauth_timestamp=" +
        timestamp.toString() +
        "&oauth_token=" +
        sessionToken["token"] +
        "&oauth_version=1.0&";
    var _headers = {
      'Authorization': '$parameters',
      'Content-Type': 'application/json'
    };
    print(_headers);
    var _body = {
      "payment_method_title": "Transferencia bancaria directa",
      "set_paid": true,
      "status": "completed",
      "customer_id": userData.idUser,
      "billing": {
        "first_name": userData.username,
        "country": "PTY",
        "email": userData.email
      },
      "line_items": [
        {"product_id": productID, "quantity": 1}
      ]
    };
    final supabody = jsonEncode(_body);
    var res = await http.post("$baseURL/wc/v3/orders",
        headers: _headers, body: supabody);
    print(res.statusCode);
    if (res.statusCode == 201) {
      Map<String, dynamic> jsonResponse = json.decode(res.body);
      print(jsonResponse);
      return jsonResponse;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>> queryGetOrderByVendor({User userData}) async {
    Random rand = Random();
    List<int> codeUnits = List.generate(10, (index) {
      return rand.nextInt(26) + 97;
    });
    String nonce = String.fromCharCodes(codeUnits);
    int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    dynamic sessionToken = await FlutterSession().get("tokens");
    String parameters = "oauth_consumer_key=" +
        WooPraemi.consumerKeyConst +
        "&oauth_nonce=" +
        nonce +
        "&oauth_signature_method=HMAC-SHA1&oauth_timestamp=" +
        timestamp.toString() +
        "&oauth_token=" +
        sessionToken["token"] +
        "&oauth_version=1.0&";
    var _headers = {
      'Authorization': '$parameters',
      'Content-Type': 'application/json'
    };
    var res = await http.get(
        "$baseURL/wp-json/wc/v2/orders/?vendor=${userData.idUser}",
        headers: _headers);

    if (res.statusCode == 201) {
      Map<String, dynamic> jsonResponse = json.decode(res.body);
      return jsonResponse;
    } else {
      return null;
    }
  }
}
