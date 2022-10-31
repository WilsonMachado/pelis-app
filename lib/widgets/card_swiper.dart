import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {

    ///* El MediaQuery es un widget que facilita la obtención de la información relacionada a la plataforma en la que está corriendo la app, las dimensiones del dispositivo, la orientación, entre otras cosas.
    
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      color: Colors.red,
      child: Swiper(
        
        itemCount: 10, // Cantidad de tarjetas que vamos a poner
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.9,
        
        ///* Función que se dispara construir el widget. Si no se usa el BuildContext, se pone un guión al piso: ( _, int index) por ejemplo. Lo importante de esta función es devolver un widget para renderizar la tarjeta.

        itemBuilder: ( _, int index) { 
          return const FadeInImage(
            placeholder: NetworkImage('https://picsum.photos/500/300?image=1'), // Imagen de loading
            image: NetworkImage('https://picsum.photos/500/300?image=1') // Imagen que viene de internet
            );
        }, 
        ),
    );
  }
}