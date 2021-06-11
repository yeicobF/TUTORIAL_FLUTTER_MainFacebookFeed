import 'package:flutter/material.dart';
// Cambiar colores de la "status bar" y la barra inferior con botones del
// celular.
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart'
    show FlutterStatusbarcolor;
// ÍCONOS MATERIAL DESIGN.
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart'
    show MdiIcons;

/// Colores
import '../config/palette.dart' show Palette;
/// Información predefinida de los usuarios.
import '../data/data.dart' show currentUser, onlineUsers, posts, stories;
import '../models/models.dart' show Post;
/// Botones, ...
import '../widgets/widgets.dart' show CircleButton, CreatePostContainer, PostContainer, Rooms, Stories;

/// CLASE EN LA QUE SE MANEJARÁ LA PANTALLA INICIAL DE FACEBOOK.
class HomeScreen extends StatelessWidget {
  /// Colores del botón del SliverAppBar.
  final fbColors = {
    "fbIconCircle": const Color(0xFFf1f2f6),
    "fbIcon": const Color(0xFF010102),
  };

  @override
  Widget build(BuildContext context) {
    /// CAMBIAR COLOR DEL statusBar (barra superior de notificaciones).
    /// https://stackoverflow.com/questions/52489458/how-to-change-status-bar-color-in-flutter
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    /// Íconos de la barra superior de notificaciones de color negro.
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);

    return Scaffold(
      body: CustomScrollView(
        /// [slivers]: Todo deben ser slivers, no solo contenedores.
        slivers: [
          /// [SliverAppBar]:
          /// - Scroll hacia abajo -> Se esconde la barra superior.
          /// - Scroll hacia arriba -> Se muestra la barra superior.
          SliverAppBar(
            // Se cambian los colores de los elementos de la barra de
            // notificaciones.
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            centerTitle: false,

            /// Para no tener que hacer scroll hasta arriba para que se vea la
            /// [AppBar].
            floating: true,
            backwardsCompatibility: true,

            /// Para que se vea una sombra debajo de la [AppBar].
            /// [forceElevated]: true,
            title: const Text(
              "facebook",
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),

            /// [actions]: Para hacer funcionar a los botones.
            actions: [
              /// Para simular el círculo gris de alrededor del ícono.
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

          /// Los elementos requieren estar en un [Sliver] para poder estar
          /// dentro los "[slivers]" del [CustomScrollView].
          const SliverToBoxAdapter(
            // Contenedor debajo de la AppBar.
            // Sección para crear una publicación.
            child: CreatePostContainer(currentUser: currentUser),
          ),

          /// [Sliver] con [Padding] para estar separado de la parte superior.
          /// [Rooms] Lista de usuarios conectados.
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            // Toma otro sliver, el cual ya teníamos definido.
            sliver: SliverToBoxAdapter(
              // Lista de usuarios conectados.
              child: Rooms(onlineUsers: onlineUsers),
            ),
          ),

          /// Lista con todas las historias.
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            // Toma otro sliver, el cual ya teníamos definido.
            sliver: SliverToBoxAdapter(
              /// [Stories] Lista de las historias.
              child: Stories(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          ),

          /// Publicaciones de los usuarios.
          SliverList(
            /// [delegate] - {SliverChildDelegate delegate}
            /// Creates a sliver that places box children in a
            /// linear array.
            ///
            /// [SliverChildBuilderDelegate] es como un equivalente al
            /// [ListView.builder()].
            delegate: SliverChildBuilderDelegate(
              /// Función para renderizar todas las publicaciones.
              (BuildContext context, int index) {
                /// Publicación respecto al índice actual.
                final Post post = posts[index];

                /// Renderizar el post actual.
                return PostContainer(post: post);
              },

              /// [childCount]: Número de elementos a mostrar.
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
