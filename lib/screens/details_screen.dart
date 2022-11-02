import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // TODO: Cambiar luego por una instancia de movie

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie'; ///* Recibe como argumento la instancia de la película. Si es nulo, pone 'no-movie' por defecto.

    return Scaffold(
      body: CustomScrollView(
        ///! El CustomScrollView recibe slivers, que son widgets con acciones preprogramadas en caso de que se haga scroll en el contenido del padre; es decir, son widgets, pero con un comportamiento especial al hacer scroll
        slivers: [
          const _CustomAppBar(),
          SliverList( // Lista para contener widgets normales (no de tipo Slivers)
            delegate: SliverChildListDelegate([
              const _PosterAndTitle(),
            ]
            )
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    ///? Existen numerosos slivers (ver el canal de Youtube de Fernando para tener ejemplos). En este caso, se usa un SliverAppBar

    return SliverAppBar(
      backgroundColor: Colors.red,
      expandedHeight: 200,
      floating: false,
      pinned: true, // Para que nunca desaparezca
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title:  Container( 
          // Con el fin de oscurecer el texto del título en caso de que la imagen sea muy clara 
          width: double.infinity, // Ancho completo
          alignment: Alignment.bottomCenter, // Texto centrado abajo
          color: Colors.black54, // Filtro para la imagen
          child: const Text( // Título de la película
            'movie.title',
            style: TextStyle(fontSize: 16), // Tamaño de letra
            ),

        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://picsum.photos/500/300?image=3'),
          fit: BoxFit.cover, // Para que expanda la imagen todo lo que pueda sin perder las dimensiones de la iagen
          ),
      ),

    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect( // Para colocar una imagen con los bordes redondeados
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://picsum.photos/200/300?image=3'),
              height: 150, // Para evitar el brinco de la imagen de loading junto con la imagen traída de la red
              ),
          ),
          
          const SizedBox( width: 20,),

          Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [ // Título de la película en cartelera
              
              Text('movie.title', 
              style: textTheme.headline5,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,),

              Text('movie.originalTitle', // Título en el idioma original
              style: textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,),

              Row( // Puntuación de las películas según comentarios
                children: [
                  const Icon( Icons.star_outline, size: 15, color: Colors.grey,),
                  const SizedBox(width: 5,),
                  Text('movie.voteAverage', style: textTheme.caption,),
                ],
              ),

            ],),
        ],
      ),
    );
  }
}