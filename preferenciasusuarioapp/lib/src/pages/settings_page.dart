import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';
import 'package:preferenciasusuarioapp/src/share_prefs/preferencias_usuario.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textController;  
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();    
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;
    _textController = new TextEditingController(text: prefs.nombre);
  }  

  void _setSelectedRadio(int value){
    prefs.genero = value;
    _genero = value;
    setState(() {  });
  }

  void _setColorSecundario(bool value){
    prefs.colorSecundario = value;
    _colorSecundario = value;
    setState(() {  });
  }

  void _setNombre(String value){
    prefs.nombre = value;
    _nombre = value;
    setState(() {  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container( 
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: _setColorSecundario,
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona',
              ),
              onChanged: _setNombre,
            ),
          ),
        ],
       ),
    );
  } 
}