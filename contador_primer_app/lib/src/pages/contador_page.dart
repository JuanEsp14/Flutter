import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _ContadorPageState();
  }

}

class _ContadorPageState extends State<ContadorPage>{

  final TextStyle _estiloTexto = new TextStyle(fontSize: 25);
  int _conteo = 0;
  
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
              Text('Número de clicks:', style: _estiloTexto,),
              Text('$_conteo', style: _estiloTexto,)
            ],
          )
        ),
        floatingActionButton: _crearBotones()
            );
          }
        
        
        
  //Funcion de crear boonoes
  Widget _crearBotones() {

    return Row(
      children: <Widget>[
        SizedBox(width: 20.0,),
        FloatingActionButton(
          child: Icon(Icons.exposure_zero), 
          onPressed: _reiniciar,
        ),
        Expanded(child: SizedBox(width: 5.0,)),
        FloatingActionButton(
          child: Icon(Icons.remove), 
          onPressed: _restar,
        ),
        SizedBox(width: 5.0,),
        FloatingActionButton(
          child: Icon(Icons.add), 
          onPressed: _sumar,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.end,
      ); 
  }

  void _sumar(){
    setState(() => _conteo++);
  }

  void _restar(){
    setState(() => _conteo--);
  }

  void _reiniciar(){
    setState(() => _conteo = 0);
  }
}