import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:form_validation/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: (){},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form( 
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                _crearPrecio(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(  
        labelText: 'Producto'
      ),
      validator: (value) => (value.length < 3) ? 'Ingrese el nombre del producto' : null,
    );    
  }

  Widget _crearPrecio() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true), //Para que aparezca la coma en el teclado
      decoration: InputDecoration(  
        labelText: 'Precio'
      ),
      validator: (value) => utils.isNumeric(value) ? null : 'Ingrese solo valores numéricos'  ,
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      icon: Icon(Icons.save),
      label: Text('Guardar'),
      onPressed: _submit,
      color: Colors.deepPurple,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
    );
  }

  void _submit(){
    if(!formKey.currentState.validate()) return;

    print('Todo OK');
  }
}