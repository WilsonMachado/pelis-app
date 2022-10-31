import 'package:flutter/material.dart';
import '../widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Películas en cines'),
        ),
        elevation: 0,        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon( Icons.search_outlined ) ),
        ],
      ),
      body: SingleChildScrollView( ///* Permite hacer scroll si existe overflow en los widgets
        child: Column(
        children: const [
          CardSwiper(), // Tarjetas principales
          MovieSlider() // Slider de películas
        ],
       )),
      );
    
  }
}