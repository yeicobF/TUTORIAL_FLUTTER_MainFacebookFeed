import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/widgets.dart' show CustomTabBar;

/// PANTALLAS.
import 'screens.dart';

/// Pantallas de navegación.
///
/// En esta clase se manejarán todas las pantallas.
///
/// Permitirá tener una [CustomTabBar] para poder cambiar entre pantallas y que
/// siempre se mantenga a la vista.
///
/// Es stateful, ya que tendrá que manejar los cambios entre pantallas,
/// manteniendo el estado de la pestaña seleccionada.
class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  /// Lista de las pantallas de la app.
  final List<Widget> _screens = [
    HomeScreen(),
    // Scaffold por ahora, ya que no están hechas las pantallas.
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  /// Lista de íconos para la [CustomTabBar].
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  /// Índice seleccionado.
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    /// CAMBIAR COLOR DEL statusBar (barra superior de notificaciones).
    /// https://stackoverflow.com/questions/52489458/how-to-change-status-bar-color-in-flutter
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    /// Íconos de la barra superior de notificaciones de color negro.
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);

    /// [DefaultTabController] para manejar el número de pestañas.
    return DefaultTabController(
      /// Número de pestañas = número de íconos.
      length: _icons.length,
      child: Scaffold(
        /// [_screens[_selectedIndex]: Número de pantalla seleccionada.
        body: _screens[_selectedIndex],

        /// [bottomNavigationBar]: Barra inferior de navegación.
        bottomNavigationBar: CustomTabBar(
          icons: _icons,
          selectedIndex: _selectedIndex,

          /// El índice actual de la pestaña seleccionada es el que se
          /// establece como el índice de la pantalla actual.
          onTap: (int index) => setState(() => _selectedIndex = index),
        ),
      ),
    );
  }
}
