import 'package:flutter_wordpress/models/page_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PageProvider{

  String _url = 'babydeal.ie';
  String _apiKey = '/wp-json/wp/v2/pages';

  Future<List<Page>> getPages() async {

    final url = Uri.http(_url, _apiKey);
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final page = new Pages.fromJsonList(decodedData);

    print(decodedData);
    return page.items;

  }

}