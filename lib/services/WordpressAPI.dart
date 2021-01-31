import 'dart:collection';
import 'dart:developer';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;

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

  Future<bool> queryMakeOrder({User userData, int productID}) async {
    String tokenUser = await FlutterSession().get("tokens");
    print(tokenUser);
    // String oauthSignature = _getOAuthURL("POST", "orders", tokenUser);
    // print(oauthSignature);
    // var _body = {
    //   "payment_method_title": "Transferencia bancaria directa",
    //   "set_paid": true,
    //   "status": "completed",
    //   "customer_id": userData.idUser,
    //   "billing": {
    //     "first_name": userData.username,
    //     "country": "PTY",
    //     "email": userData.email
    //   },
    //   "line_items": [
    //     {"product_id": productID, "quantity": 1}
    //   ]
    // };
    // http.Client client = http.Client();
    // http.Request request = http.Request('POST', Uri.parse('orders'));
    // request.headers[HttpHeaders.contentTypeHeader] =
    //     'application/json; charset=utf-8';
    // request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    // request.body = json.encode(_body);
    // String response =
    //     await client.send(request).then((res) => res.stream.bytesToString());
    // print(response);
    // var dataResponse = await json.decode(response);

    // _handleError(dataResponse);
    // print(dataResponse);
    // return dataResponse;
    // if (res.statusCode == 201) {
    //   Map<String, dynamic> jsonResponse = json.decode(res.body);
    //   print(jsonResponse);
    //   return jsonResponse;
    // } else {
    //   return null;
    // }
    return true;
  }

  Future<Map<String, dynamic>> queryGetOrderByVendor({User userData}) async {
    Random rand = Random();
    List<int> codeUnits = List.generate(10, (index) {
      return rand.nextInt(26) + 97;
    });
    String nonce = String.fromCharCodes(codeUnits);
    int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    dynamic sessionToken = await FlutterSession().get("tokens");
    String oauth_signature = "";
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

    var headers2 = {
      'Authorization': 'OAuth oauth_consumer_key="' +
          WooPraemi.consumerKeyConst +
          '",oauth_token="' +
          sessionToken["token"] +
          '",oauth_signature_method="HMAC-SHA1",oauth_timestamp="' +
          timestamp.toString() +
          '",oauth_nonce="' +
          nonce +
          '",oauth_version="1.0",oauth_signature="' +
          oauth_signature +
          '"',
      'Content-Type': 'application/json'
    };
    var res = await http.get(
        "$baseURL/wp-json/wc/v2/orders/?vendor=${userData.idUser}",
        headers: headers2);

    if (res.statusCode == 201) {
      Map<String, dynamic> jsonResponse = json.decode(res.body);
      return jsonResponse;
    } else {
      return null;
    }
  }

  /// This Generates a valid OAuth 1.0 URL
  ///
  /// if [isHttps] is true we just return the URL with
  /// [consumerKey] and [consumerSecret] as query parameters
  String _getOAuthURL(String requestMethod, String endpoint, String tokenUser) {
    String consumerKey = WooPraemi.consumerKeyConst;
    String consumerSecret = WooPraemi.consumerSecretConst;
    String token = tokenUser;
    print('oauth token = : ' + token);
    String url = WooPraemi.baseUrlConst + WooPraemi.apiPathConst + endpoint;
    print(url);
    bool containsQueryParams = url.contains("?");

    // if (false == true) {
    //   return url +
    //       (containsQueryParams == true
    //           ? "&consumer_key=" +
    //               this.consumerKey +
    //               "&consumer_secret=" +
    //               this.consumerSecret
    //           : "?consumer_key=" +
    //               this.consumerKey +
    //               "&consumer_secret=" +
    //               this.consumerSecret);
    // }

    Random rand = Random();
    List<int> codeUnits = List.generate(10, (index) {
      return rand.nextInt(26) + 97;
    });

    /// Random string uniquely generated to identify each signed request
    String nonce = String.fromCharCodes(codeUnits);

    /// The timestamp allows the Service Provider to only keep nonce values for a limited time
    int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    String parameters = "oauth_consumer_key=" +
        consumerKey +
        "&oauth_nonce=" +
        nonce +
        "&oauth_signature_method=HMAC-SHA1&oauth_timestamp=" +
        timestamp.toString() +
        "&oauth_token=" +
        token +
        "&oauth_version=1.0&";

    if (containsQueryParams == true) {
      parameters = parameters + url.split("?")[1];
    } else {
      parameters = parameters.substring(0, parameters.length - 1);
    }

    Map<dynamic, dynamic> params = QueryString.parse(parameters);
    Map<dynamic, dynamic> treeMap = new SplayTreeMap<dynamic, dynamic>();
    treeMap.addAll(params);

    String parameterString = "";

    for (var key in treeMap.keys) {
      parameterString = parameterString +
          Uri.encodeQueryComponent(key) +
          "=" +
          treeMap[key] +
          "&";
    }

    parameterString = parameterString.substring(0, parameterString.length - 1);

    String method = requestMethod;
    String baseString = method +
        "&" +
        Uri.encodeQueryComponent(
            containsQueryParams == true ? url.split("?")[0] : url) +
        "&" +
        Uri.encodeQueryComponent(parameterString);

    String signingKey = consumerSecret + "&" + token;
    crypto.Hmac hmacSha1 =
        crypto.Hmac(crypto.sha1, utf8.encode(signingKey)); // HMAC-SHA1

    /// The Signature is used by the server to verify the
    /// authenticity of the request and prevent unauthorized access.
    /// Here we use HMAC-SHA1 method.
    crypto.Digest signature = hmacSha1.convert(utf8.encode(baseString));

    String finalSignature = base64Encode(signature.bytes);

    String requestUrl = "";

    if (containsQueryParams == true) {
      requestUrl = url.split("?")[0] +
          "?" +
          parameterString +
          "&oauth_signature=" +
          Uri.encodeQueryComponent(finalSignature);
    } else {
      requestUrl = url +
          "?" +
          parameterString +
          "&oauth_signature=" +
          Uri.encodeQueryComponent(finalSignature);
    }
    print(finalSignature);
    return requestUrl;
  }

  _handleError(dynamic response) {
    if (response['message'] == null) {
      return response;
    } else {
      throw Exception(response.toString());
    }
  }
}

class QueryString {
  /// Parses the given query string into a Map.
  static Map parse(String query) {
    RegExp search = RegExp('([^&=]+)=?([^&]*)');
    Map result = Map();

    // Get rid off the beginning ? in query strings.
    if (query.startsWith('?')) query = query.substring(1);

    // A custom decoder.
    decode(String s) => Uri.decodeComponent(s.replaceAll('+', ' '));

    // Go through all the matches and build the result map.
    for (Match match in search.allMatches(query)) {
      result[decode(match.group(1))] = decode(match.group(2));
    }

    return result;
  }
}
