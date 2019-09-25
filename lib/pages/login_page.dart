import 'package:flutter/material.dart';
import 'package:flutter_wordpress/bloc/provider.dart';
import 'package:flutter_wordpress/providers/user_provider.dart';
import 'package:flutter_wordpress/utils/utils.dart';

class LoginPage extends StatelessWidget {
  final userProvider = new UserProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.login(context);
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
                      _passwordField(media, bloc),
                      _divider(media),
                      _buttonsSignIn( media, theme, bloc),
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

  Widget _usernameField(MediaQueryData media, LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.only(
            right: media.size.width * 0.1,
            left: media.size.width * 0.05,
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
                errorText: snapshot.error,
                hintText: snapshot.data,
                counterText: snapshot.data,
                ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _passwordField(MediaQueryData media, LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.only(
                right: media.size.width * 0.1,
                left: media.size.width * 0.05,
                top: media.size.width * 0.1),
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
                  errorText: snapshot.error),
              onChanged: bloc.changePassword,
            ),
          );
        });
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

  Widget _buttonsSignIn(MediaQueryData media, ThemeData theme, LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidLoginStream,
      builder: (context, snapshot) {
        return RaisedButton(
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
          onPressed: snapshot.hasData ? () => _login(context, bloc) : null,
        );
      }
    );
  }

  _login(BuildContext context, LoginBloc bloc)async{
    Map info = await userProvider.login(bloc.email, bloc.password);

    if(info['ok']){
      Navigator.pushReplacementNamed(context, 'post');
    }else{
      showAlert(context, 'User or password incorrect');
    }

  }

  Widget _buttonRegister(
      BuildContext context, MediaQueryData media, ThemeData theme) {
    return FlatButton(
      child: Text(
        "Don't have an Account? Click Here for Register",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: theme.textTheme.body1.fontFamily,
            fontSize: theme.textTheme.body1.fontSize,
            color: theme.textTheme.body1.color),
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, 'register');
      },
    );
  }
}
