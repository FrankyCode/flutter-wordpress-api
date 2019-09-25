import 'package:flutter_wordpress/API/api.dart';
import 'package:flutter_wordpress/providers/media_provider.dart';
import 'package:flutter_wordpress/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_wordpress/models/post_model.dart';

class PostProvider{
  final mediaProvider = MediaProvider();
  final userProvider = UserProvider();

  // Base URL for our wordpress API
  String _url = URLPOST;

  // Api
  String _apiKey = '/wp-json/wp/v2/posts';

   Future<List<Post>> getPosts() async {

    final url  = Uri.http(_url, _apiKey);
    final resp = await http.get(url);
    if(resp.statusCode == 200){
    final List<Post>  posts = postFromJson(resp.body);
      return posts;

    }else{
      throw Exception('Failed to load Data');

    }
  }

  Future<List> getBoth() async {
    final media = await mediaProvider.getMedias();
    final post = await getPosts();
    //final map = new Map();´
    final list = new List();

    for (var med in media) {
      for (var pos in post) {
          if(med.id == pos.featuredMedia){
            String title = pos.title.rendered;
            String img = med.guid.rendered;
            list.add({title, img});
          }
      }
    }

    return list;
  }

  


}