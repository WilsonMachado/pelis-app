import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('App de películas'),
        ),
      ),
      body: const Center(
        child: Text('Details Screen'),
      ),
    );
  }
}