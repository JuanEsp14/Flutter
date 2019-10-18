import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final TextStyle estiloTexto = new TextStyle(fontSize: 25);
  final int conteo = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My app'),
        centerTitle: true,    
        backgroundColor: Color.fromRGBO(180, 180, 180, 0.5),    
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Número de clicks:', style: estiloTexto,),
              Text('$conteo', style: estiloTexto,)
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print('Hola Mundo');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}