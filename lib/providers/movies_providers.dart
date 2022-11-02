import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:pelis_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  // Se debe extender la clase de ChangeNotifier para que MovieProvider sea un provider válido

  final String _apiKey = '51e8eab352ad039f13bbcd07f1f2671d';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnNowPlayMovies();
  }

  getOnNowPlayMovies() async {
    // Crea la URL de la petición

    final url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // Realiza una petición get

    final response = await http.get(url);

    // Convierte el resultado en un JSON
    final NowPlayingResponse nowPlayingResponse =
        NowPlayingResponse.fromJson(response.body);
    // Antes se realizaba de esta manera: final Map<String, dynamic> decodeData = json.decode(response.body);

    // Imprime el resultado para corroborar

    //print(nowPlayingResponse.results[0].overview);

    // Lista que contiene la información con la respuesta mapeada

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners(); ///! Este método le indica a todos los Widgets que estén escuchando por cambios y solo redibuja los que han cambiado (los necesarios)
  }
}
