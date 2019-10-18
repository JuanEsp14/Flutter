import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final estiloTitulo =  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubitulo =  TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[          
            _primercomulmna(),
            _segundaColumna(),
            _terceraColumna(),
            _cuartaColumna(),
            _cuartaColumna(),
            _cuartaColumna(),
            _cuartaColumna(),
            _cuartaColumna(),
          ],
        )
        
      )
    );
  }

   Widget _primercomulmna() {
    return Container(
      width: double.infinity,
      child: Image(
              image: NetworkImage('https://www.heritagecouncil.ie/content/projects/_project/landscapes.jpg'),
              height: 200.0,
              fit: BoxFit.cover,
            ),
    );
  }

  Widget _segundaColumna() {
    return SafeArea(
      child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Lago con un puente', style: estiloTitulo),
                        SizedBox(height: 7.0),
                        Text('Lago de Alemania',style: estiloSubitulo)
                      ],
                    ),
                  ),
                  
                  Icon(Icons.star, color:Colors.red, size:30.0),

                  Text('41', style: TextStyle(fontSize: 20.0))
                ],
              ),
            ),
    );
  }

  Widget _terceraColumna() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _crearBoton(Icons.call, 'CALL'),
        _crearBoton(Icons.near_me, 'ROUTE'),
        _crearBoton(Icons.share, 'Share'),
      ],
    );
  }

  Widget _crearBoton(IconData icono, String texto){
    return Column(
          children: <Widget>[
            Icon(icono, color: Colors.blue, size: 40.0),
            SizedBox(height: 1.5),
            Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue))
          ],
        );
  }

  Widget _cuartaColumna() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean finibus augue interdum, commodo neque a, scelerisque sapien. Mauris imperdiet nunc eget tristique maximus. Aliquam erat volutpat. Donec velit ex, venenatis et orci accumsan, sollicitudin cursus purus. Curabitur blandit feugiat mattis. Donec risus urna, imperdiet vel turpis a, pellentesque interdum tellus. Nunc sollicitudin, sem id condimentum aliquet, turpis neque consectetur turpis, at mollis urna orci sit amet erat. Nulla cursus feugiat ullamcorper.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

 
}