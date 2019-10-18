import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qr_reader_app/src/models/scan_model.dart';

class MapaPage extends StatefulWidget {

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final map = new MapController();

  String tipoMapa = 'streets';

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){
              map.move(scan.getLatLng(), 15);
            },
          )
        ],
      ),
      body: _crearFlutterMap(scan),
      floatingActionButton: _crearFloatingActionButton(context),
    );
  }

  Widget _crearFlutterMap(ScanModel scan) {
    return FlutterMap(
      mapController: map,
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 13.0,
      ),
      layers: [
        _crearMapa(),
        _crearMarcadores(scan)
      ],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
          urlTemplate: "https://api.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken': 'pk.eyJ1IjoianVhbWVzcCIsImEiOiJjanhtNGVubTgwMDFiM2dwMDRvc2Z4ZmNuIn0.gj_2FBXlnAbe4lY2VU9LzQ',
            'id': 'mapbox.$tipoMapa', //streets, dark, light, outdoors, satellite
          },
        );
  }

  _crearMarcadores(ScanModel scan) {
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),
          builder: (context) => Container(
            child: Icon( 
              Icons.location_on, 
              size: 45.0,
              color: Theme.of(context).primaryColor,  
            ),
          )
        )
      ]
    );
  }

  Widget _crearFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        switch (tipoMapa){
          case 'streets': tipoMapa = 'dark'; break;
          case 'dark': tipoMapa = 'light'; break;
          case 'light': tipoMapa = 'outdoors'; break;
          case 'outdoors': tipoMapa = 'satellite'; break;
          default: tipoMapa = 'streets';
        }

        setState(() { });
        
      },
      child: Icon(Icons.repeat),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}

 