import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pelis_app/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    ///* El MediaQuery es un widget que facilita la obtención de la información relacionada a la plataforma en la que está corriendo la app, las dimensiones del dispositivo, la orientación, entre otras cosas.

    final size = MediaQuery.of(context).size;

    return SizedBox(
      // Me cambió el Container por un SizedBox porque el color de fondo pasó a blanco
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length, // Cantidad de tarjetas que vamos a poner
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.47,

        ///* Función que se dispara construir el widget. Si no se usa el BuildContext, se pone un guión al piso: ( _, int index) por ejemplo. Lo importante de esta función es devolver un widget para renderizar la tarjeta.

        itemBuilder: (_, int index) {
          final movie = movies[index];          

          return GestureDetector(
            // Widget que permite hacer clic en las imagenes
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'), // Imagen de loading
                image: NetworkImage(movie.getPosterMovie), // Imagen que viene de internet
                fit: BoxFit.cover, // Adapta el tamaño de la imagen al contenedor padre,
              ),
            ),
          );
        },
      ),
    );
  }
}
