// Crear contenedor para las publicaciones.

import 'package:flutter/material.dart';
import '../models/models.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser; // Usuario actual.

  const CreatePostContainer({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: Colors.orange,
    );
  }
}
