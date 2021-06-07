// Crear contenedor para la parte superior en donde se encuentra la foto de
// perfil, la posibilidad de publicar, y algunos otros botones.

// cached_network_image/cached_network_image.dart
// - Obtenemos una imagen de un URL de internet.
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser; // Usuario actual.

  const CreatePostContainer({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.0,
      color: Colors.orange,
      child: Column(
        children: [
          Row(
            children: [
              // Crea un avatar circular.
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey[200],
                // Imagen de fondo obtenida de un URL.
                backgroundImage:
                    CachedNetworkImageProvider(currentUser.imageUrl),
              ),
              // Que tome todo el espacio disponible.
              Expanded(
                // Campo de texto.
                child: TextField(
                  // Decoración del input del TextField.
                  // InputDecoration.collapsed: InputDecoration del mismo tamaño
                  //  que el InputField.
                  decoration: InputDecoration.collapsed(
                    hintText: "What's on your mind?",
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
