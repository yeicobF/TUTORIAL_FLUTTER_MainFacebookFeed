import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart' show Palette;
import '../models/models.dart' show Post;
import 'widgets.dart' show ProfileAvatar;

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

      /// Columna con la parte superior de la publicación + texto + imagen
      child: Column(
        children: [
          /// El [Padding] es necesario solamente en la información de la parte
          /// superior y en el texto de la publicación pero no en la imagen como
          /// tal, por lo que solamente se pone el padding a esos elementos.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),

            /// Columna con:
            /// - Información de la publicación:
            ///
            ///   - Foto de perfil
            ///   - Nombre + Hace cuánto se hizo la publicación
            ///   - Ícono de más
            ///
            /// - Texto (descripción) de la publicación
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
                const SizedBox(height: 4.0),

                /// Texto de la publicación.
                Text(post.caption),

                /// Revisar si hay imagen o no para ver si agregar espacio debajo
                /// del texto.
                post.imageUrl != null

                    /// Si la imagen existe, no agregar espacio debajo del texto.
                    ? const SizedBox.shrink()

                    /// Si la imagen no existe -> agregar un espacio entre el texto
                    /// y la imagen.
                    : const SizedBox(
                        height: 6.0,
                      ),
              ],
            ),
          ),

          /// Imagen de la publicación si es que hay.
          post.imageUrl != null

              /// Si hay imagen, mostrarla.
              ///
              /// Esta imagen debe llevar un [Padding] arriba y abajo:
              /// [EdgeInsets.symmetric(vertical: 8.0)].
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),

                  /// La imagen como tal.
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              // Si no hay imagen, poner un widget sin tamaño (por decirlo de
              // alguna forma).
              : const SizedBox.shrink(),

          /// Post Feed
          ///
          /// Datos del post: Número de likes, comentarios, ...
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),

            /// Estadísticas de la publicación.
            child: _PostStats(post: post),
          )
        ],
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
  /// Publicacion que se mostrará.
  ///
  /// Se requiere este atributo para poder acceder a los datos de la
  /// publicación.
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
          splashRadius: 1.0,
          onPressed: () => print("More"),
        ),
      ],
    );
  }
}

/// Estadísticas de la publicación.
///
/// Se muestra:
/// - Likes
/// - Número de comentarios
/// - Número de veces compartidas
class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              /// Likes
              child: Text(
                "${post.likes}",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(width: 4.0),

            /// Comentarios
            Text(
              "${post.comments} Comments",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 4.0),

            /// Compartidas
            Text(
              "${post.shares} Shares",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        )
      ],
    );
  }
}
