import 'package:flutter/material.dart';
import 'package:flutter_wordpress/bloc/provider.dart';
import 'package:flutter_wordpress/providers/user_provider.dart';

class RegisterPage extends StatelessWidget {
  final userProvider = new UserProvider();


  @override
  Widget build(BuildContext context) {
    final bloc = Provider.regis(context);
    final media = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: media.size.height * 0.3,
                  width: media.size.width * 1,
                  padding: EdgeInsets.only(top: media.size.height * 0.01),
                  alignment: Alignment.center,
                  child: FlutterLogo(
                    size: media.size.height * 0.5,
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
                      _usernameField(media, bloc),
                      _emailField( media, bloc),
                      _passwordField( media, bloc),
                      _divider(media),
                      _buttonRegisterUser(media, theme, bloc),
                      _comebackLogin(context, media, theme),
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

   Widget _usernameField( MediaQueryData media, RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.usernameStream,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.only(
            right: media.size.width * 0.1,
            left: media.size.width * 0.05,
          ),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Colors.pink,
              ),
              border: OutlineInputBorder(),
              labelText: 'Username',
              errorText: snapshot.error
            ),
            onChanged: bloc.changeUsername,
          ),
        );
      }
    );
  }

  Widget _emailField( MediaQueryData media, RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.only(
            right: media.size.width * 0.1,
            left: media.size.width * 0.05,
            top: media.size.width * 0.05
          ),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.alternate_email,
                color: Colors.pink,
              ),
              border: OutlineInputBorder(),
              labelText: 'Email',
              errorText: snapshot.error
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      }
    );
  }

  Widget _passwordField( MediaQueryData media, RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.only(
              right: media.size.width * 0.1,
              left: media.size.width * 0.05,
              top: media.size.width * 0.05
              ),
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(
                Icons.vpn_key,
                color: Colors.pink,
              ),
              border: OutlineInputBorder(),
              labelText: 'Password',
              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),
        );
      }
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

  Widget _buttonRegisterUser(MediaQueryData media, ThemeData theme, RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidRegisterStream,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Container(
            alignment: Alignment.center,
            width: media.size.width * 0.8,
            height: media.size.height * 0.06,
            child: Text(
              'Register User',
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
          onPressed: snapshot.hasData ? () => userProvider.registerUser(context, bloc.username, bloc.email, bloc.password) : null,

        );
      }
    );
  }

  Widget _comebackLogin(
      BuildContext context, MediaQueryData media, ThemeData theme) {
    return Container(
      child: FlatButton(
        child: Text(
          "Have an Account? Click Here for Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: theme.textTheme.body1.fontFamily,
              fontSize: theme.textTheme.body1.fontSize,
              color: theme.textTheme.body1.color),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/');
        },
      ),
    );
  }
}
