import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        //children: _crearItems()
        children: _crearItemsCorto()

      ),
    );
  }

  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista..add(tempWidget)
          ..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorto(){

    return opciones.map(
      (opt){
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(opt + '!'),
              subtitle: Text('Subtitulo'),
              leading: Icon(Icons.access_alarms),
              trailing: Icon(Icons.account_balance_wallet),
              onTap: (){},
            ),
            Divider(),
          ],
        ); 
      }
    ).toList();
  }
}