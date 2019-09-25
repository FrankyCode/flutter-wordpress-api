import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_wordpress/bloc/validator.dart';

class RegisterBloc with Validators{

  final _usernameController = BehaviorSubject<String>();
  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Insert Values to Stream
  Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  // Get values to Stream
  Stream<String> get usernameStream => _usernameController.stream.transform(validateUsername);
  Stream<String> get emailStream => _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validatePassword);

  Stream<bool> get formValidRegisterStream => Observable.combineLatest3(usernameStream, emailStream, passwordStream, (u, e, p) => true);


  // Get the last value insert in Stream
  String get username => _usernameController.value;
  String get email => _emailController.value;
  String get password => _passwordController.value;





  dispose(){
    _usernameController?.close();
    _emailController?.close();
    _passwordController?.close();
  }



}