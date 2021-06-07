/**
 * CLASE EN LA QUE SE MANEJARÁ LA PANTALLA INICIAL DE FACEBOOK.
 */

import 'package:flutter/material.dart';
import '../config/palette.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar:
          // - Scroll hacia abajo -> Se esconde la barra superior.
          // - Scroll hacia arriba -> Se muestra la barra superior.
          SliverAppBar(
            // Se cambian los colores de los elementos de la barra de
            // notificaciones.
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            centerTitle: false,
            // Para no tener que hacer scroll hasta arriba para que se vea la
            // AppBar.
            floating: true,
            backwardsCompatibility: true,
            // Para que se vea una sombra debajo de la AppBar.
            // forceElevated: true,
            title: const Text(
              "facebook",
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            // actions: Para hacer funcionar a los botones.
            actions: [
              // Para simular el círculo gris de alrededor.
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.search),
                  iconSize: 30.0,
                  color: Colors.black,
                  // Lo que se ejecutará cuando el botón sea presionado.
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
