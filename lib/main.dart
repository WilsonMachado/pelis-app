import 'package:flutter/material.dart';
import 'package:pelis_app/providers/movies_providers.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';

///! Archivo de barril para las screens

void main() {
  runApp(const AppState());

  ///! Como toda la instancia que provee las películas (MoviesProvider) debe poder accederse desde toda al app, entonces debe estar en el nivel más alto del arbol de Widgets. Si se quisiera que solo sea accedido desde una pantalla, entonces se inicializa solo en el archivo propio de la pantalla.
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

        ///* Se recomienda usar de entrada MultiProvider en caso de que se necesite maś de un provider (uno para la autenticación, otro para las películar, etc)
        ///? Si se quisiera un solo provider, se puede usar un {SimpleChangeNotifierProvider}
        providers: [
          ChangeNotifierProvider(
            create: ( _ ) => MoviesProvider(), // La creación es lo que se tiene que ejecutar para crear la primera instancia del provider
            lazy: false, // De esta manera, se ejecuta el constructor de MoviesProvider. Así, toda la app puede tener conocimiento de este provider (que contendrá toda la información de las películas)
          )
        ],
        child: const MyApp(), // Primero se llama a MoviesProvider y luego a la aplicación
        );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Colors.red)),
      initialRoute: 'home',

      ///! Ruta inicial de la aplicación
      routes: {
        ///! Mapa que contiene las rutas de la aplicación

        ///? En estos casos se usa el ( _ ) porque no se para el {context}

        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen(),
      },
    );
  }
}
