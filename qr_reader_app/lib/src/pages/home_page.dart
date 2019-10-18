import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_reader_app/src/bloc/scans_bloc.dart';
import 'package:qr_reader_app/src/models/scan_model.dart';
import 'package:qr_reader_app/src/utils/scan_utils.dart' as utils;
import 'package:qrcode_reader/qrcode_reader.dart';

import 'package:qr_reader_app/src/pages/direcciones_page.dart';
import 'package:qr_reader_app/src/pages/mapas_page.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

int currentIndex = 0;

class _HomePageState extends State<HomePage> {

  final scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('QR Scanner'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: scansBloc.deleteAllScans,
            )
          ],
        ),
        body: _cargarPage(currentIndex),
        bottomNavigationBar: _crearBottomBavigationBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.filter_center_focus),
          onPressed: () => _scanQR(context),          
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  BottomNavigationBar _crearBottomBavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
         currentIndex = index; 
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapas')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text('Direcciones')
        )
      ],
    );
  }

  Widget _cargarPage(int paginaActual) {

    switch(paginaActual){
      case 0 : return MapasPage(); 
      case 1: return DireccionesPage();
      default: return MapasPage();
    }
  }

  _scanQR(BuildContext context) async{
    
    //https://www.google.com.ar
    //geo:40.68571377944765,-73.89882460078127
    String futureString = '';
    //Datos moqueados
    //String futureString = 'https://www.google.com.ar';

    try{
      futureString = await new QRCodeReader().scan();
    }catch(e){
      futureString = e.toString();
    }
    

    if (futureString != null){
      final scan = ScanModel(valor: futureString);
      scansBloc.insertScan(scan);

      if(Platform.isIOS){
        Future.delayed(Duration(milliseconds: 750), (){
          utils.openScan(context, scan);
        });
      }else{
        utils.openScan(context, scan);
      }

      
    }

    
  }
}