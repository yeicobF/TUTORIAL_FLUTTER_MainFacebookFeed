import 'package:flutter/material.dart';
import 'config/palette.dart';
// TODAS LAS PANTALLAS QUE SE EXPORTAN DESDE  ESE ARCHIVO.
import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facebook UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold,
      ),
      home: SafeArea(
        child: HomeScreen(),
      ),
    );
  }
}
