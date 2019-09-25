

import 'dart:async';

class Validators{

   final validateUsername = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink){

          if(username.length >= 6){
            sink.add(username);
          }else{
            sink.addError('Need more than 6 characters');
          }

      }
  );

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink){
        Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);

        if(regex.hasMatch(email)){
          sink.add(email);
        }else{
          sink.addError('Email is not correct');
        }
         

      }
  );


  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink){

          if(password.length >= 6){
            sink.add(password);
          }else{
            sink.addError('Need more than 6 characters');
          }

      }
  );




}

