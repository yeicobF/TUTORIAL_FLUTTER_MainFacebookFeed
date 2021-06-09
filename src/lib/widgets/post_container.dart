import 'package:flutter/material.dart';

import '../models/models.dart' show Post;

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
      height: 100.0,
      color: Colors.red,
    );
  }
}
