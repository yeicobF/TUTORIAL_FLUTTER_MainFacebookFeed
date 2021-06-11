import 'package:flutter/material.dart';
import 'config/palette.dart';
// TODAS LAS PANTALLAS QUE SE EXPORTAN DESDE  ESE ARCHIVO.
import 'screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facebook UI',

      /// [debugShowCheckedModeBanner]: Decidir si dejar o quitar la etiqueta de "Debug" al renderizar la app.
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold,
      ),

      /// Ponemos las pantallas dentro de un [SafeArea] para que no ocupe el
      /// espacio de la barra de navegación ni la de notificaciones del celular.
      home: SafeArea(
        /// Pantallas de navegación.
        child: NavScreen(),
      ),
    );
  }
}
