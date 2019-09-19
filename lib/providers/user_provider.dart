
import 'package:flutter_wordpress/API/api.dart';
import 'package:flutter_wordpress/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserProvider{

  // Base URL for our wordpress API
  String _url = URLPOST;

  // Api
  String _apiKey = '/wp-json/wp/v2/users';


  Future<List<User>> signIn() async {
    final url = Uri.http(_url, _apiKey);
    final resp = await http.post(url);

    if(resp.statusCode == 200){
    final List<User>  users = userFromJson(resp.body);
      print(users[0].name);
      return users;

    }else{
      throw Exception('Failed to load Data');

    }
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
    final url  = Uri.http(_url, _apiKey);
    final resp = await http.get(url);
    if(resp.statusCode == 200){
    final List<User>  users = userFromJson(resp.body);
      print(users[0].name);
      return users;

    }else{
      throw Exception('Failed to load Data');

    }
  }


}