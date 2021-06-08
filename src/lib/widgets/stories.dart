import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart' show Palette;
import '../models/models.dart' show Story, User;
import 'widgets.dart' show ProfileAvatar;

/// Generador de historias.
///
/// Recibe diversas historias que se renderizarán dependiendo de su información.
/// Además, recibe al usuario actual.
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
    /// Historia del usuario [index] (índice) actual.
    ///
    /// Inicializamos como la historia 0, ya que esta depende de una condición
    /// más adelante, pero tiene que estar incializada.
    ///
    /// Toma una historia de la lista de todas las historias de los usuarios.
    Story story = stories[0];

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
          /// Si el índice [index] del [itemBuilder] > 0 -> Tomar la historia
          /// del índice anterior.
          if (index > 0) story = stories[index - 1];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),

            /// Agregamos la tarjeta para crear una historia.
            child: index == 0

                /// Si estamos en el índice [index] 0, renderizar el contenedor
                /// de "Crear historias", el cual le pertenece al usuario actual
                /// [currentUser].
                ? _StoryCard(
                    /// Indicamos que sí queremos indicar que es el elemento de
                    /// agregar una historia.
                    isAddStory: true,
                    currentUser: currentUser,
                  )

                /// Ahora sí se crean las historias.
                ///
                /// Si estamos en el índice [index] > 0, mostramos la historia
                /// actual.
                : _StoryCard(
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
    /// Es un stack de elementos:
    /// - Imagen de fondo
    /// - Botón de adición
    /// - Texto inferior
    return Stack(
      children: [
        /// Imagen tomada de un URL de internet.
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            /// Si [isAddStory] == true -> Se muestra la foto de perfil del
            /// usuario actual como fondo del recuadro de la historia.
            /// Si [isAddStory] == false -> Se muestra foto de la historia de
            /// otro usuario.
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,

            /// Toma TODA la altura del contenedor.
            height: double.infinity,
            width: 110.0,
            // Que la imagen cubra todo el espacio disponible del contenedor.
            fit: BoxFit.cover,
          ),
        ),

        /// Degradado para que el texto inferior sea más legible. Va de más
        /// oscuro desde abajo y claro arriba.
        Container(
          /// Altura máxima del contenedor.
          height: double.infinity,
          width: 110.0,

          /// [decoration] es el degradado. Se hace más oscura la imagen.
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),

        /// Ícono o foto de perfil de usuario en la parte superior izquierda.
        ///
        /// Si [isAddStory] == true -> Mostrar ícono de crear historia.
        ///
        /// Si [isAddStory] == false -> Mostrar la foto de perfil del usuario
        /// que creó la historia.
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory

              /// Se muestra el botón para añadir nueva historia, ya que se
              /// trata del espacio del usuario que está utilizando la App.
              ? Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    iconSize: 30.0,
                    color: Palette.facebookBlue,
                    onPressed: () => print("Add to story"),
                  ),
                )

              /// Se muestra la foto de perfil del usuario (amigo) que publicó
              /// la historia.
              /// 
              /// La imagen muestra un círculo azul alrededor de la foto de
              /// perfil.
              : ProfileAvatar(
                  imageUrl: story.user.imageUrl,
                  /// En [hasBorder] mandamos el valor [story.isViewed], el
                  /// cual indica si una historia ha sido vista o no.
                  /// 
                  /// Si la historia ya se vio ([story.isViewed] == true) -> No
                  /// se dibujará el borde azul circular alrededor de la
                  /// historia.
                  /// 
                  /// Si la historia no se ha visto ([story.isViewed] == false)
                  /// -> se dibujará el borde azul alrededor de la foto de
                  /// perfil.
                  /// 
                  /// ![story.isViewed] significa que si la historia se ha
                  /// visto, no tiene borde:
                  /// 
                  /// -> ![story.isViewed] = true -> [hasBorder] = false.
                  /// -> ![story.isViewed] = false -> [hasBorder] = true.
                  hasBorder: !story.isViewed,
                ),
        )
      ],
    );
  }
}
