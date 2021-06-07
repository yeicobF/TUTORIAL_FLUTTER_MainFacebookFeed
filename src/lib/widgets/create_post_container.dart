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
      // EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0)
      // - fromLTRB: Left, Top, Right, Bottom.
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      // height: 100.0,
      color: Colors.white,
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
              // Agregamos un espacio entre la foto de perfil y el texto.
              // const: No se vuelve a renderizar.
              const SizedBox(
                width: 8.0,
              ),
              // Que tome todo el espacio disponible.
              const Expanded(
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
          ),
          // Divider: Línea divisora.
          const Divider(
            height: 10.0,
            thickness: 0.5,
          ),
          // Fila en donde se encuentran 3 botones: Live, Photo, Room.
          Container(
            // Altura definida. Esto provoca que el VerticalDivider se vea.
            height: 40.0,
            child: Row(
              // Separar los elementos entre sí.
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // FlatButton.icon: FUE DEPRECADO POR TextButton.icon.
                // Botón con un ícono y texto.
                TextButton.icon(
                  onPressed: () => print("Live"),
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: const Text(
                    "Live",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                // VerticalDivider: Dividor vertical que no se ve, solo pone un
                // espacio entre los elementos.
                const VerticalDivider(
                  width: 8.0,
                ),
                TextButton.icon(
                  onPressed: () => print("Photo"),
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: const Text(
                    "Photo",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const VerticalDivider(
                  width: 8.0,
                ),
                TextButton.icon(
                  onPressed: () => print("Room"),
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: const Text(
                    "Room",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
