
import 'package:flutter/material.dart';
import 'package:flutter_wordpress/providers/media_provider.dart';
import 'package:flutter_wordpress/providers/post_provider.dart';
import 'package:flutter_wordpress/providers/user_provider.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userProvider = new UserProvider();
  final postProvider = new PostProvider();
  final mediaProvider = new MediaProvider();

   TextEditingController controllerUser = new TextEditingController();

   TextEditingController controllerPass = new TextEditingController();

  String mensaje = '';

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  //color: Colors.blueAccent,
                  height: media.size.height * 0.3,
                  width: media.size.width * 1,
                  padding: EdgeInsets.only(top: media.size.height * 0.01),
                  alignment: Alignment.center,
                  child: FlutterLogo(
                      size:  media.size.height * 0.5,
                    ),
                ),
                Container(
                  height: media.size.height * 0.66,
                  width: media.size.width * 1,
                  alignment: Alignment.center,
                  //color: Colors.greenAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _emailField(context, media),
                      _passwordField(context, media),
                      _divider(media),
                      _buttonsSignIn(context, media, theme),
                      _buttonRegister(context, media, theme),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context, MediaQueryData media) {
    return Container(
      padding: EdgeInsets.only(
        right: media.size.width * 0.1,
        left: media.size.width * 0.05,
      ),
      child: TextField(
        controller: controllerUser,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.alternate_email,
            color: Colors.pink,
          ),
          border: OutlineInputBorder(),
          labelText: 'Email',
        ),
      ),
    );
  }

  Widget _passwordField(BuildContext context, MediaQueryData media) {
    return Container(
      padding: EdgeInsets.only(
          right: media.size.width * 0.1,
          left: media.size.width * 0.05,
          top: media.size.width * 0.1),
      child: TextField(
        controller: controllerPass,
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(
            Icons.vpn_key,
            color: Colors.pink,
          ),
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _divider(MediaQueryData media) {
    return Container(
      padding: EdgeInsets.only(
          top: media.size.height * 0.04, bottom: media.size.height * 0.05),
      child: Divider(
        color: Colors.pink,
        height: media.size.height * 0.01,
        indent: 20.0,
        endIndent: 20.0,
      ),
    );
  }

  Widget _buttonsSignIn(
      BuildContext context, MediaQueryData media, ThemeData theme) {
    return Container(
      child: RaisedButton(
        child: Container(
          alignment: Alignment.center,
          width: media.size.width * 0.8,
          height: media.size.height * 0.06,
          child: Text(
            'Log In',
            style: TextStyle(
              fontFamily: theme.textTheme.button.fontFamily,
              fontSize: theme.textTheme.button.fontSize,
              color: theme.textTheme.button.color,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 0.0,
        color: Colors.pinkAccent,
        onPressed: () {
          print('User \n Username: ${controllerUser.text} \n Password: ${controllerPass.text}');
          userProvider.login(controllerUser.text, controllerPass.text);
          Navigator.pushReplacementNamed(context, 'home');
       
          
        },
      ),
    );
  }

  Widget _buttonRegister(
      BuildContext context, MediaQueryData media, ThemeData theme) {
    return Container(
      child: FlatButton(
        child: Text(
          "Don't have an Account? Click Here for Register",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: theme.textTheme.body1.fontFamily,
              fontSize: theme.textTheme.body1.fontSize,
              color: theme.textTheme.body1.color),
        ),
        onPressed: () {
          //userProvider.getUsers();
          //postProvider.getPosts();
          mediaProvider.getMedia();
          //Navigator.pushNamed(context, 'register');
        },
      ),
    );
  }
}
