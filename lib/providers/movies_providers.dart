import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier { // Se debe extender la clase de ChangeNotifier para que MovieProvider sea un provider válido
  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnNowPlayMovies();
  }

  getOnNowPlayMovies() async {
    print('getOnNowPlayMovies');
  }
}
