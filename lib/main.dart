import 'package:flutter/material.dart';
import 'package:flutter_wordpress/bloc/provider.dart';
import 'package:flutter_wordpress/pages/ads_page.dart';
import 'package:flutter_wordpress/pages/login_page.dart';
import 'package:flutter_wordpress/pages/post_page.dart';
import 'package:flutter_wordpress/pages/register_page.dart';
import 'package:flutter_wordpress/preferences/user_preferences.dart';

void main() async {
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new UserPreferences();
    //print(prefs.token);
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: prefs.lastPage,
        routes: {
          '/': (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'post': (BuildContext context) => PostPage(),
          'ads': (BuildContext context) => AdsPage(),
        },
      ),
    );
  }
}
