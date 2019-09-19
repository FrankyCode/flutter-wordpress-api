import 'package:flutter_wordpress/API/api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_wordpress/models/media_model.dart';

class MediaProvider{

  String _url = URLPOST;
  String _apiKey = '/wp-json/wp/v2/media';


  Future<List<Media>> getMedias() async {
    final url  = Uri.http(_url, _apiKey);
    final resp = await http.get(url);
    if(resp.statusCode == 200){
    final List<Media>  media = mediaFromJson(resp.body);
    //print('Media ID: ${media[0].id}');
    //print('Media Image: ${media[0].guid.rendered}');
      return media;

    }else{
      throw Exception('Failed to load Data');

    }
  }


}