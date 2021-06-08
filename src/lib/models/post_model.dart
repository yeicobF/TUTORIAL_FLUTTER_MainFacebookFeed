import 'package:meta/meta.dart';
import 'models.dart' show User;

/// Clase para manejar las publicaciones.
class Post {
  /// Usuario al que pertenece el post.
  final User user;
  /// Descripción (texto) del post.
  final String caption;
  /// Hace cuánto tiempo se hizo la publicación.
  final String timeAgo;
  /// URL de la imagen a mostrar.
  final String imageUrl;
  /// Número de likes.
  final int likes;
  /// Número de comentarios.
  final int comments;
  /// Número de veces que se compartió la publicación.
  final int shares;

  const Post({
    @required this.user,
    @required this.caption,
    @required this.timeAgo,
    @required this.imageUrl,
    @required this.likes,
    @required this.comments,
    @required this.shares,
  });
}
