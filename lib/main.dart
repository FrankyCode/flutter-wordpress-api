import 'package:flutter/material.dart';
import 'package:flutter_wordpress/bloc/provider.dart';
import 'package:flutter_wordpress/pages/login_page.dart';
import 'package:flutter_wordpress/pages/pages_page.dart';
import 'package:flutter_wordpress/pages/post_page.dart';
import 'package:flutter_wordpress/pages/register_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'home': (BuildContext context) => PostPage(),
          'pages': (BuildContext context) => PagesPage(),
        },
      ),
    );
  }
}
