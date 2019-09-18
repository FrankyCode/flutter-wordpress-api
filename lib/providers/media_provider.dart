import 'dart:convert';

import 'package:flutter_wordpress/models/media_model.dart';
import 'package:http/http.dart' as http;

class MediaProvider{

  String _url = 'babydeal.ie';
  String _apiKey = '/wp-json/wp/v2/media';

  Future<List<Media>> getMedia() async {

    final url  = Uri.http(_url, _apiKey);
    final resp = await http.get(url);

    final decodeData = json.decode(resp.body);

    final medias = new Medias.fromJsonList(decodeData);

    print(medias.items[0].guid.rendered[0]);

    return medias.items;

  }


}