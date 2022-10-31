import 'package:flutter/material.dart';
import 'screens/screens.dart'; ///! Archivo de barril para las screens

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.red
        )
      ),
      initialRoute: 'home', ///! Ruta inicial de la aplicación
      routes: {             ///! Mapa que contiene las rutas de la aplicación

        ///? En estos casos se usa el ( _ ) porque no se para el {context}
        
        'home'    : ( _ ) => const HomeScreen(),  
        'details' : ( _ ) => const DetailsScreen(), 
      },
      
    );
  }
}