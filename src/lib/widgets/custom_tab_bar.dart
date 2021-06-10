import 'package:flutter/material.dart';

/// Barra de navegación personalizada.
///
/// Se encuentra la barra de navegación con los íconos que recibe.
class CustomTabBar extends StatelessWidget {
  /// Lista de íconos.
  final List<IconData> icons;

  /// Índice seleccionado para indicar la pantalla actual.
  final int selectedIndex;

  /// Función para cuando se de un toque a uno de los elementos.
  ///
  /// Recibe como parámetro un entero, el cuál será el índice.
  final void Function(int index) onTap;

  const CustomTabBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// [TabBar]: Barra de pestañas.
    return TabBar(
      /// Cada uno de los elementos de dicha barra, será un ícono de los
      /// obtenidos por parámetro.
      tabs: icons

          /// Se hace un mapeo de los íconos para poderlos establecerlos como
          /// las [tabs].
          /// 
          /// [.map] regresa un iterable.
          .map(
            /// Cada elemento del mapa se convierte en una [Tab], dado que con
            /// la función de debajo se itera por cada uno de los elementos del
            /// arreglo.
            /// 
            /// Estos elementos se establecen como el [icon] de cada una de las
            /// [Tab]. Por esta razón, el "[icon]: [Icon(currentIconInMap)]".
            (currentIconInMap) => Tab(
              icon: Icon(currentIconInMap),
            ),
          )
          .toList(),
    );
  }
}
