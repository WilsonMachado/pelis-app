import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.red,
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text('Populares', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ),

        ///? En este punto, la columna define sus dimensiones basados en sus hijos y el ListViewBuilder define sus dimensiones basado en sus padres. Por lo tanto, aquí hay una inconsistencia. El ListViewBuider no sabe qué tamaño debe tener, porue su padre es fexible.
        
        ///! Para resolver el problema anterior, se envuelve el ListView.builder en un Expanded

        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Para que el scroll sea horizontal
            itemCount: 20,
            itemBuilder: (_, int index) => const _MoviePoster()            
          ),
        ),

      ]),
    );
  }
}

///! Widgets privados que solo viven en el widget principal

class _MoviePoster extends StatelessWidget { 
  const _MoviePoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 130,
            height: 190,
            color: Colors.green,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    );
  }
}