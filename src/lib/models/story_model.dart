import 'package:meta/meta.dart';
import 'models.dart';

// Clase para manejar las historias.

class Story {
  final User user;
  final String imageUrl;
  final bool isViewed;

  const Story({
    @required this.user,
    @required this.imageUrl,
    this.isViewed = false,
  });
}
