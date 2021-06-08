import 'package:meta/meta.dart';
import 'models.dart' show User;

/// Clase para manejar las historias.
class Story {
  /// Usuario de quien es la historia.
  final User user;
  /// URL de la imagen de la historia.
  final String imageUrl;
  /// Indicador de si ya se vio la historia o aún no.
  final bool isViewed;

  const Story({
    @required this.user,
    @required this.imageUrl,
    this.isViewed = false,
  });
}
