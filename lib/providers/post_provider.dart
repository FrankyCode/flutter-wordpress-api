import 'package:flutter_wordpress/API/api.dart';
import 'package:flutter_wordpress/models/post_model.dart';
import 'package:flutter_wordpress/providers/user_provider.dart';
import 'package:http/http.dart' as http;

class PostProvider{
  final userProvider = UserProvider();

  // Base URL for our wordpress API
  String _url = URLDEVELOP;

  // Api
  String _apiKey = '/wp-json/wl/v2/posts';

   
  Future<List<Posts>> getPosts() async {
    final url = '$_url$_apiKey';
    final resp = await http.get(url);
    if(resp.statusCode == 200){
      final List<Posts> posts = postsFromJson(resp.body);
      print(posts[0].featuredImage.medium);
      return posts;
    }else{
      throw Exception('Failed to load Data');
    }
  }


}