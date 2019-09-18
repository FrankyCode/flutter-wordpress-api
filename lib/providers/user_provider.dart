import 'dart:convert';

import 'package:flutter_wordpress/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserProvider{

  // Base URL for our wordpress API
  String _url = '10.0.2.2';

  // Api
  String _apikey = '/wordpress/wp-json/wp/v2/users';

  // Api for Login


  Future<List<User>> signIn() async {
    final url = Uri.http(_url, _apikey);
    final resp = await http.post(url);

    final decodedData = json.decode(resp.body);
    final users = new Users.fromJsonList(decodedData);

    return users.items;

  }

  Future<http.Response> login(String username, String password) async {
    try{
      final url = 'http://babydeal.ie/wp-json/jwt-auth/v1/token?username=$username&password=$password';
      final resp = await http.post(url);
      return resp;

    }catch(e){
       print('Error: $e \n -----Problems with textfield---- \n Username: $username \n Password: $password');
       return e;
    }
  }

  Future<List<User>> getUsers() async {
    final url = Uri.http(_url, _apikey);
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
    final users = new Users.fromJsonList(decodedData);

    // print(decodedData[0]);
    print(users.items[0].name);

    return users.items;

  }


}