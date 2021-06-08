/// CLASE EN LA QUE SE MANEJARÁ LA PANTALLA INICIAL DE FACEBOOK.
import 'package:flutter/material.dart';
// Cambiar colores de la "status bar" y la barra inferior con botones del
// celular.
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart'
    show FlutterStatusbarcolor;
// Íconos de Font Awesome.
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
// ÍCONOS MATERIAL DESIGN.
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart'
    show MdiIcons;

// Colores
import '../config/palette.dart';
// Información predefinida de los usuarios.
import '../data/data.dart';
// Botones, ...
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  // Colores del botón del SliverAppBar
  final fbColors = {
    "fbIconCircle": const Color(0xFFf1f2f6),
    "fbIcon": const Color(0xFF010102),
  };

  @override
  Widget build(BuildContext context) {
    // CAMBIAR COLOR DEL statusBar
    // https://stackoverflow.com/questions/52489458/how-to-change-status-bar-color-in-flutter
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    return Scaffold(
      body: CustomScrollView(
        // slivers: Todo deben ser slivers, no solo contenedores.
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
              CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                // icon: FontAwesomeIcons.search,
                // iconSize: 26.0,
                onPressed: () => print("Search"),
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30.0,
                onPressed: () => print("Messenger"),
              ),
            ],
          ),
          // Los elementos requieren estar en un Sliver para poder estar dentro
          // los "slivers" del CustomScrollView.
          SliverToBoxAdapter(
            // Contenedor debajo de la AppBar.
            // Sección para crear una publicación.
            child: CreatePostContainer(currentUser: currentUser),
          ),
          // Sliver con padding para estar separado de la parte superior.
          // [Rooms] Lista de usuarios conectados.
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            // Toma otro sliver, el cual ya teníamos definido.
            sliver: SliverToBoxAdapter(
              // Lista de usuarios conectados.
              child: Rooms(onlineUsers: onlineUsers),
            ),
          ),
          // [Stories] Lista de las historias.
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            // Toma otro sliver, el cual ya teníamos definido.
            sliver: SliverToBoxAdapter(
              // Lista de usuarios conectados.
              child: Stories(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
