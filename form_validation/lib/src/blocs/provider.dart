import 'package:flutter/material.dart';
import 'package:form_validation/src/blocs/login_bloc.dart';
export 'package:form_validation/src/blocs/login_bloc.dart';

class Provider extends InheritedWidget {

  //Tipo de clase raíz del InheritedWidget
  //Es conveniente mantener el BLOC si tiene datos
  final loginBloc = LoginBloc();

  //Con este Provider se pierde la información cuando se re-dibuja el widget
  //Provider({Key key, Widget child}) : super(key: key, child: child);

  //Para mantener la información es necesario utilizar un singleton para así establecer
  //si el Provider ya contiene datos no se debe crear de nuevo 
  static Provider _instancia;

  factory Provider({Key key, Widget child}){
    if( _instancia == null ){
      _instancia = new Provider._internal(key: key, child: child);
    }

    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify( Provider oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider)as Provider).loginBloc;
  }    
}
