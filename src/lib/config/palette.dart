import 'package:flutter/material.dart';

// Clase donde estarán los gradientes y colores en general a utilizar en la app.
// La forma de acceder sería:
//
//  Palette.nombreVariable
//
// Ya que todas las variables son estáticas.
class Palette {
  static const Color scaffold = Color(0xFFF0F2F5);

  static const Color facebookBlue = Color(0xFF1777F2);

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [
      Color(0xFF496AE1),
      Color(0xFFCE48B1),
    ],
  );

  static const Color online = Color(0xFF4BCB1F);

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.black26,
    ],
  );
}
