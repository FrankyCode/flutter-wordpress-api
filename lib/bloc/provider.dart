import 'package:flutter/material.dart';

import 'package:flutter_wordpress/bloc/login_bloc.dart';
export 'package:flutter_wordpress/bloc/login_bloc.dart';

import 'package:flutter_wordpress/bloc/register_bloc.dart';
export 'package:flutter_wordpress/bloc/register_bloc.dart';


class Provider extends InheritedWidget{


  // Instancia for save data if use hot reload
  static Provider _instancia;
  factory Provider({Key key, Widget child}){

    if(_instancia == null){
      _instancia = new Provider._internal(key: key, child: child);
    }

    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);



  final loginBloc = LoginBloc();
  final registerBloc = RegisterBloc();


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc login ( BuildContext context ){
    return ( context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;

  }

  static RegisterBloc regis (BuildContext context){
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).registerBloc;
  }
  

}