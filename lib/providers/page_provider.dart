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


  Future<List<Page>> getAds() async{
    final url = Uri.http(_url, _apiKey,{
        "include" : "4780"
    });

    final resp = await http.get(url);
    if(resp.statusCode == 200){
     List<Page> page = respon(resp.body);
      return page;
    }else{
      throw Exception('Failed to load Data');
    }
  }


  Future<List> getInfoAds()async{
    final ads = await getAds();
    final list = new List();
    // Expresion Regular para obtener la URL    
    var regExp = RegExp(r'[^(src=\\")]([^"])+(png|jpg|gif)');
    for (var ad in ads) {
      // Obtengo la Descripcion
        var description = ad.content.rendered;
        //print('Description: $description');
        assert(regExp.hasMatch(description));

        for (var match in regExp.allMatches(description)) {
            // URL ADS
            //print('URL: ${match[0]}');
            list.add(match[0]);
        }
        
    }

    return list;

  }



}