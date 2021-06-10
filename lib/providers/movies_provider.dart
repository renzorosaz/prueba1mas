import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';
import 'package:pruebamas1/models/movie_model.dart';

class PeliculasProvider {
  String _apikey = '1865f43a0549ca50d341dd9ab8b29f49';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    print("peliculas" + peliculas.toString());
    return peliculas.items;
  }

  Future<List<Pelicula>> getPeliculas() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});

    return await _procesarRespuesta(url);
  }
}
