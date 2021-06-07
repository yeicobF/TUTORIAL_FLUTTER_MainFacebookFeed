/// Clase en donde  se mostrará la barra horizontal en donde se muestran los
/// usuarios conectados.
import 'package:flutter/material.dart';

import '../config/palette.dart'; // Colores.
import '../models/models.dart' show User; // Usuario, historias, ...
import 'widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({
    Key key,
    @required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
        scrollDirection: Axis.horizontal,
        // itemCount: 1 (Botón de "Create Room") + número de usuarios online.
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          // Si el índice == 0 -> creamos botón para crear Rooms.
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              // _CreateRoomButton() <- Widget privado que se encontrará en este
              // archivo.
              child: _CreateRoomButton(),
            );
          }
          // user: Usuario actual renderizado a partir del índice 1, ya que el 0
          // es el botón de "Create Room".
          final User user = onlineUsers[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ProfileAvatar(
              imageUrl: user.imageUrl,
              // isActive: true,
            ),
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // OutlineButton: DEPRECADO.
    return OutlinedButton(
      onPressed: () => print("Create Room"),

      // style: Podemoss cambiar el estilo del botón para darle las esquinas
      // redondeadas.
      // - https://www.woolha.com/tutorials/flutter-using-outlinedbutton-widget-examples
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(
          color: Palette.facebookBlue,
        ),
        side: BorderSide(
          width: 3.0,
          color: Colors.blueAccent[100],
        ),
        // backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      // FILA CON ÍCONO Y TEXTO.
      child: Row(
        children: [
          // Crear un gradiente de colores.
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35.0,
              // Esto cambia el color del gradiente para el ícono de la cámara.
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          const Text("Create\nRoom"),
        ],
      ),
    );
  }
}
