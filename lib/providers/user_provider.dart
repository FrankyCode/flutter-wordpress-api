import 'dart:convert';

import 'package:flutter_wordpress/API/api.dart';
import 'package:flutter_wordpress/preferences/user_preferences.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  // Base URL for our wordpress API
  final _url = URLPOSTHTTPS;
  final _prefs = new UserPreferences();

  // Token
  String token = '';

  Future<Map<String, dynamic>> login(String username, String password) async {
    final authData = {"username": username, "password": password};

    final resp = await http.post(
      '$_url/wp-json/jwt-auth/v1/token',
      headers: {'Content-type': 'application/json'},
      body: json.encode(authData),
    );

    Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('token')) {
      // Save TOken in storage
      _prefs.token = decodeResp['token'];
      return {'ok': true, 'token': decodeResp['token']};
    } else {
      return {'ok': false, 'mensaje': decodeResp['message']};
    }
  }

  Future<Map<String, dynamic>> registerUser(
      String username, String email, String password) async {
    final authData = {
      "username": username,
      "email": email,
      "password": password
    };

    final resp = await http.post('$_url/wp-json/wp/v2/users/register',
        headers: {'Content-type': 'application/json'},
        body: json.encode(authData));

    Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp['code'] == 200) {
      print(decodeResp['message']);
      return {'ok': true, 'mensaje': decodeResp['message']};
    } else {
      print(decodeResp['message']);
      return {'ok': false, 'mensaje': decodeResp['message']};
    }
  }

  Future logout(token) async {
    final url = '$_url/jwt-auth/v1/token/revoke';
    final resp =
        await http.post(url, headers: {"Authorization": "Bearer" + token});
    print(resp);
  }
}
