import 'dart:convert';

import 'package:flutter_wordpress/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostProvider{

  // Base URL for our wordpress API
  //String _urlDev = '10.0.2.2';
  String _url = 'babydeal.ie';

  // Api
  //String _apiKeyDev = '/wordpress/wp-json/wp/v2/posts';
  String _apiKey = '/wp-json/wp/v2/posts';


  Future<List<Post>>getPosts() async{

    final url = Uri.http(_url, _apiKey);
    final resp = await http.get( url );


    final decodedData = json.decode(resp.body);

    //print('-------- RESPUESTA DE LA API --------- \n $decodedData');

    final posts = new Posts.fromJsonList(decodedData);

    print(posts.items[0].title.rendered);
    print(posts.items[0].jetpackFeaturedMediaUrl);
    print(posts.items[0].links.wpFeaturedmedia[0].href);



    return posts.items;

  }


}