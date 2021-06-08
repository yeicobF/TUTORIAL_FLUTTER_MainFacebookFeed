import 'package:meta/meta.dart';

/// Clase para manejar los usuarios.
class User {
  /// Nombre del usuario actual.
  final String name;
  /// URL de una imagen de internet.
  final String imageUrl;

  const User({
    @required this.name,
    @required this.imageUrl,
  });
}
