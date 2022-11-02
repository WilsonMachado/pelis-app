import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // TODO: Cambiar luego por una instancia de movie

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie'; ///* Recibe como argumento la instancia de la película. Si es nulo, pone 'no-movie' por defecto.

    return const Scaffold(
      body: CustomScrollView(
        ///! El CustomScrollView recibe slivers, que son widgets con acciones preprogramadas en caso de que se haga scroll en el contenido del padre; es decir, son widgets, pero con un comportamiento especial al hacer scroll
        slivers: [
          _CustomAppBar(),
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
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black54,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),),

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