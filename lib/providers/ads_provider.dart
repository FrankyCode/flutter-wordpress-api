import 'package:flutter_wordpress/API/api.dart';
import 'package:flutter_wordpress/models/ads_model.dart';
import 'package:http/http.dart' as http;

class AdsProvider{

String _url = URLDEVELOP;


Future<List<Ads>> getAds() async {
  final url = '$_url/wp-json/wl/v2/ads';
  final resp = await http.get(url);
  if(resp.statusCode == 200){
    final List<Ads> ads = adsFromJson(resp.body);
    return ads;
  }else{
    throw Exception('Failed to load Data');
  }
  
}


}