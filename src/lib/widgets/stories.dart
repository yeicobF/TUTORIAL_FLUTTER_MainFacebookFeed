import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';

/// CLASE PARA CREAR LAS HISTORIAS.
class Stories extends StatelessWidget {
  /// Usuario actual.
  final User currentUser;

  /// Lista de las historias.
  final List<Story> stories;

  const Stories({
    Key key,
    @required this.currentUser,
    @required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.purple,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 8.0,
        ),
        scrollDirection: Axis.horizontal,

        /// [itemCount]:
        /// 1 (Contenedor para agregar una hisoria),
        /// + [stories.length] (Número de historias)
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          // Si estamos en el índice 0, renderizar el contenedor de "Crear
          // historias."
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),

              /// Agregamos la tarjeta para crear una historia.
              child: _StoryCard(
                /// Indicamos que sí queremos indicar que es el elemento de
                /// agregar una historia.
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          }

          /// Historia del usuario [index] (índice) actual.
          final Story story = stories[index - 1];

          /// Ahora sí se crean las historias.
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),

            /// Agregamos la tarjeta para crear una historia.
            child: _StoryCard(
              /// Pasamos la historia actual para renderizarla.
              story: story,
            ),
          );
        },
      ),
    );
  }
}

/// Creador de historias.
///
/// Es una clase privada en donde se podrán crear las historias de los usuarios,
/// o la tarjeta que indica la posibilidad de creación de una historia.
///
/// - [isAddStory] indica si se quiere mostrar el botón de agregar historia o
/// no. Por default es false.
///
/// - [currentUser] es el usuario actual para crear la historia.
///
/// - [story] indica la historia a mostrar.
///
class _StoryCard extends StatelessWidget {
  /// Indica si se quiere mostrar el botón de agregar historia o no. Por
  /// default es false.
  final bool isAddStory;

  /// Usuario actual para crear la historia.
  final User currentUser;

  /// Indica la historia a mostrar.
  final Story story;

  const _StoryCard({
    Key key,
    this.isAddStory = false,
    this.currentUser,
    this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
