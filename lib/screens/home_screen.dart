import 'package:flutter/material.dart';
import 'package:pelis_app/providers/movies_providers.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///! El provider siempre se llama en el build, porque se necesita el context

    final moviesProvider = Provider.of<MoviesProvider>(context);

    ///* Entre los signos de < > se pasa al provider al que se desea apuntar

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Películas en cines'),
        ),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
        ],
      ),
      body: SingleChildScrollView(

          ///* Permite hacer scroll si existe overflow en los widgets
          child: Column(
        children: [
          CardSwiper( movies: moviesProvider.onDisplayMovies, ), // Tarjetas principales
          const MovieSlider(), // Slider de películas
        ],
      )),
    );
  }
}
