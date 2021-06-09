import 'package:flutter/material.dart';

import '../models/models.dart' show Post;
import 'widgets.dart';

/// Manejador de publicaciones de usuarios.
///
/// Se manejan las publicaciones de los usuarios, las cuales pueden tener
/// solamente texto o también una imagen.
class PostContainer extends StatelessWidget {
  /// Publicación a mostrar.
  final Post post;

  const PostContainer({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      /// El [Padding] es necesario solamente en la información de la parte
      /// superior y en el texto de la publicación pero no en la imagen como
      /// tal, por lo que solamente se pone el padding a esos elementos.
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        /// Columna con todas las publicaciones.
        child: Column(
          /// Queremos que la columna se estire en todo el contenedor.
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            /// Parte superior de la publicación con información.
            ///
            /// - Foto de perfil
            /// - Column(Nombre + hace cuánto tiempo se creó la publicación)
            /// - Ícono de más
            _PostHeader(post: post),
          ],
        ),
      ),
    );
  }
}

/// Parte superior de las publicaciones con diversos elemetos.
///
/// - Foto de perfil
/// - Column(Nombre + hace cuánto tiempo se creó la publicación)
/// - Ícono de más
class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Foto de perfil del usuario.
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
        ),
        const SizedBox(width: 8.0),

        /// [Expanded] para que la columna ocupe todo el espacio de entre los
        /// otros 2 Widgets.
        Expanded(
          /// Nombre del usuario + Información de publicación.
          child: Column(
            /// [CrossAxisAlignment.start] para asegurarnos de que todo se
            /// coloque del lado izquierdo.
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Nombre del usuario.
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              /// Fila de elementos con información de la fecha de publicación.
              Row(
                children: [
                  /// [•] lo saqué de internet porque no pude hacerlo.
                  Text(
                    "${post.timeAgo} •",
                    style: TextStyle(
                      /// Propiedades iguales a las del ícono para mantenerlas
                      /// consistentes.
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              ),
            ],
          ),
        ),

        /// Ícono de más.
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print("More"),
        ),
      ],
    );
  }
}
