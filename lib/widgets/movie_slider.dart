import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text('Populares', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ),

        ///? En este punto, la columna define sus dimensiones basados en sus hijos y el ListViewBuilder define sus dimensiones basado en sus padres. Por lo tanto, aquí hay una inconsistencia. El ListViewBuider no sabe qué tamaño debe tener, porue su padre es fexible.
        
        ///! Para resolver el problema anterior, se envuelve el ListView.builder en un Expanded

        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Para que el scroll sea horizontal
            itemCount: 20,
            itemBuilder: (_, int index) => _MoviePoster()            
          ),
        ),

      ]),
    );
  }
}

///! Widgets privados que solo viven en el widget principal

class _MoviePoster extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 130,
            height: 190,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'details', arguments: 'ovie-instance'),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const FadeInImage(
                      placeholder: AssetImage('assets/no-image.jpg'),
                      image: NetworkImage('https://picsum.photos/300/400?image=2'),
                      width: 130,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Text(
                  'Starwars: El retorno del Jedi de W para conquistar el mundo',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                )
              ],
            ),
    );
  }
}