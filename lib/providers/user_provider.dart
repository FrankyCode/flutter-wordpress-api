import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_wordpress/API/api.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  // Base URL for our wordpress API
  final _url = URLPOSTHTTPS;

  // Token
  String token = '';

  Future login(String username, String password) async {
    final authData = {
        "username": username,
        "password": password
      };

      final resp = await http.post('$_url/wp-json/jwt-auth/v1/token', 
      headers: {'Content-type': 'application/json'}, 
      body: json.encode(authData),
      );

      Map<String, dynamic> decodeResp = json.decode(resp.body);
      print(decodeResp);

      if (decodeResp.containsKey('token')) {
        // Save TOken in storage
        return decodeResp['token'];
      } else {
        print('Error Username or Password wrong');
      }
    
  }

  Future registerUser(BuildContext context, String username, String email, String password) async {
      final authData = {
        "username": username,
        "email": email,
        "password": password

      };

      final resp = await http.post('$_url/wp-json/wp/v2/users/register', 
      headers: {'Content-type': 'application/json'}, 
      body: json.encode(authData));

      Map<String, dynamic> decodeResp = json.decode(resp.body);
     print(decodeResp);
    
    if(decodeResp['code'] == 200 ){
      print(decodeResp['message']);
      Navigator.pushReplacementNamed(context, '/');
    }else{
      //showAlert(context, 'error');
      print(decodeResp['message']);
    }

   
  }

  Future logout(token) async {
    final url = '$_url/jwt-auth/v1/token/revoke';
    final resp = await http.post(url, headers: {"Authorization": "Bearer" + token});
    print(resp);
  }
}
