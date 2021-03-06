import 'package:flutter/material.dart';
import 'package:form_validation/src/blocs/provider.dart';
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar( 
        title: Text('Home Page'),
      ),
      body: Container(),
      floatingActionButton: _crearBoton(context),
    );
  }

  FloatingActionButton _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon( Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'producto'),
      backgroundColor: Colors.deepPurple,
    );
  }
}