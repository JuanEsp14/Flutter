

import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:form_validation/src/blocs/validators.dart';

class LoginBloc with Validators{
  
  //final _emailController = StreamController<String>.broadcast();
  //final _passwordController = StreamController<String>.broadcast();
  //Para la clase rxdart no funciona con los StreamController por ello se cambian por BehaviorSubject que funcionan casi de la misma 
  //manera. Estos permiten obtener el último valor obtenido de ellos
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  

  //Recuperar los datos del Stream
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);
  Stream<bool> get formValidStream => Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);

  
  //Insertar datos
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }

}