import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {

  final estiloTexto = TextStyle(color: Colors.white, fontSize: 50.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          _pagina2()
        ],
      ),
    );
  }

  Widget _pagina1() {
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }
  

  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover,
      ),
    );
  }
  
  Widget _textos() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          Text('11º', style: estiloTexto),
          Text('Miercoles', style: estiloTexto),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 70.0)
        ],
      ),
    );
  }

  Widget _pagina2() {
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _botonCentrado()
      ],
    );
  }

  Widget _botonCentrado() {
    return Center(
      child:
        RaisedButton(
          shape: StadiumBorder(),
          onPressed: () {},
          color: Colors.blue,
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text(
              'Bienvenidos',
              style: TextStyle(fontSize: 20, color: Colors.white)
            ),
          ),
        ),
    );
  }
}