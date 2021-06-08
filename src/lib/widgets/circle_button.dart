import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon; // ÍCONO.
  final double iconSize; // TAMAÑO DE ÍCONO.
  final void Function() onPressed; // FUNCIÓN A EJECUTAR CON EL ÍCONO.

  const CircleButton({
    Key key,
    // ÍCONO.
    @required this.icon,
    // TAMAÑO DE ÍCONO.
    @required this.iconSize,
    // FUNCIÓN A EJECUTAR CON EL ÍCONO.
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        splashRadius: iconSize,
        icon: Icon(icon),
        iconSize: iconSize,
        color: Colors.black,
        // Lo que se ejecutará cuando el botón sea presionado.
        onPressed: onPressed,
      ),
    );
  }
}
