import 'dart:async';

import 'package:qr_reader_app/src/bloc/validators.dart';
import 'package:qr_reader_app/src/providers/db_provider.dart';

class ScansBloc with Validators{
  static final ScansBloc _singleton = new ScansBloc._internal();
  factory ScansBloc(){
    return _singleton;
  }

  ScansBloc._internal(){
    //obtener resultados de la base de datos
    getAllScans();
  }

  final _scanStreamController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scanStreamController.stream.transform(validarGeo);
  Stream<List<ScanModel>> get scansStreamHttp => _scanStreamController.stream.transform(validarHttp);

  dispose(){
    _scanStreamController?.close();
  }
  
  getAllScans() async{
    _scanStreamController.sink.add(await DBProvider.db.getAllScans());
  }

  insertScan(ScanModel scan) async{
    await DBProvider.db.nuevoScan(scan);
    getAllScans();
  }


  deleteScan(int id) async {
    await DBProvider.db.deleteScan(id);
    getAllScans();
  }

  deleteAllScans() async{
    await DBProvider.db.deleteAll();
    getAllScans();
  }
}