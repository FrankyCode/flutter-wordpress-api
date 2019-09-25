import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_wordpress/bloc/validator.dart';

class LoginBloc with Validators{

  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Insert Values to Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  // Get values to Stream
  Stream<String> get emailStream => _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validatePassword);

  Stream<bool> get formValidLoginStream => Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);


  // Get the last value insert in Stream
  String get email => _emailController.value;
  String get password => _passwordController.value;





  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }



}