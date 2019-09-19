import 'package:flutter_wordpress/API/api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_wordpress/models/page_model.dart';


class PageProvider{


  String _url = URLPOST;
  String _apiKey = '/wp-json/wp/v2/pages/';

  
  Future<List<Page>> getPages() async {
    final url  = Uri.http(_url, _apiKey);
    final resp = await http.get(url);
    if(resp.statusCode == 200){
    final List<Page>  pages  = pagesFromJson(resp.body);
    print(pages[0].guid.rendered);
    return pages;

    }else{
      throw Exception('Failed to load Data');

    }
  }


  Future getAds() async{
    final url = Uri.http(_url, _apiKey,{
        "include" : "4780"
    });

    final resp = await http.get(url);
    if(resp.statusCode == 200){
      Page page = pageFromJson(resp.body);
      return page;
    }else{
      throw Exception('Failed to load Data');
    }
  }



}