import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/actores_model.dart';
import 'dart:convert';
import 'dart:async';

import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaProvider{
//https://www.themoviedb.org/
  String _apiKey = '5bf50a4f4c6d701368f143eed42a6104';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';
  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams(){
    _popularesStreamController?.close();
  }

  Future <List<Pelicula>> _procesarRespuesta(Uri url) async{
    final res = await http.get(url);
    final decodeData = json.decode(res.body);
    final peliculas = Peliculas.fromJSONList(decodeData['results']);

    return peliculas.items;  
  }

  Future <List<Pelicula>> getEnCines() async{
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'languaje' : _languaje
    });

     return await _procesarRespuesta(url);
  }

    Future <List<Pelicula>> getPopulares() async{
      if (_cargando) return[];
      _cargando = true;
      _popularesPage++;
      final url = Uri.https(_url, '3/movie/popular', {
        'api_key'   : _apiKey,
        'languaje'  : _languaje,
        'page'      : _popularesPage.toString(),
      });

      final resp = await _procesarRespuesta(url);
      _populares.addAll(resp);
      popularesSink(_populares);

      _cargando = false;
      return resp;
  }

  Future<List<Actor>> getActores(String peliId) async{
    final url = Uri.https(_url, '3/movie/$peliId/credits',{
      'api_key' : _apiKey,
      'languaje' : _languaje
    });
    final res = await http.get(url);
    final decodeData = json.decode(res.body);
    final cast = Actores.fromJSONList(decodeData['cast']);

    return cast.actores;  
  }

  Future<List<Pelicula>> buscarPelicula(String query) async{
    final url = Uri.https(_url, '3/search/movie',{
      'api_key'   : _apiKey,
      'languaje'  : _languaje,
      'query'     : query
    });
    return await _procesarRespuesta(url);
  }
}
