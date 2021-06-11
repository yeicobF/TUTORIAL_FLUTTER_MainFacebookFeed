import 'package:flutter/material.dart';

import '../config/palette.dart';

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
    ///
    /// Cambia el focus de cada pestaña en la barra automáticamente al dar
    /// click.
    return TabBar(
      indicatorPadding: EdgeInsets.zero,

      /// [indicator] se refiere al indicador de que estás en el elemento
      /// (pestaña) acutal.
      indicator: const BoxDecoration(
        /// Borde superior azul para indicar que estás en dicha pestaña.
        border: Border(
          top: BorderSide(
            color: Palette.facebookBlue,
            width: 3.0,
          ),
        ),
      ),

      /// Cada uno de los elementos de dicha barra, será un ícono de los
      /// obtenidos por parámetro.
      ///
      /// Requiere un lista de [Tab]s: [List<Widget> tabs].
      tabs: icons

          /// Se convierte la lista de íconos a un mapa.
          ///
          /// Esto requerirá un índice ([iconIndex]) y devolver un [MapEntry].
          .asMap()

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
            ///
            /// Además, se recibe un índice del ícono, con el cual se podrá
            /// comprobar si el índice [iconIndex] es el mismo que el de la
            /// pestaña seleccionada [_selectedIndex].
            ///
            /// - Se devuelve un [MapEntry] porque se convirtió la lista en un
            /// mapa.
            (iconIndex, currentIconInMap) => MapEntry(
              /// [MapEntry] requiere de un índice ([iconIndex]) que se refiere
              /// a la llave, y el valor de cada llave ([Tab]). Después podemos
              /// tomar cada valor del mapa sin tomar su llave.
              iconIndex,
              Tab(
                icon: Icon(
                  currentIconInMap,
                  size: 30.0,

                  /// Si el ícono actual es el mismo índice que el de la
                  /// pestaña seleccionada, entonces ponerle un color azul.
                  color: iconIndex == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.black45,
                ),
              ),
            ),
          )

          /// Con [.values] se obtienen solo los valores del mapa y no las
          /// llaves.
          .values

          /// Al haber obtenido los valores del mapa de pestañas, se puede
          /// convertir en una lista, que es lo que requiere el atributo [tabs].
          ///
          /// Se devuelve una lista de widgets ([List<Widget>]) con solo
          /// pestañas ([Tab()]), las cuales se generaron al hacer el mapeado
          /// de los íconos.
          .toList(),

      /// Función a ejecutar al dar click a otra pestaña.
      onTap: onTap,
    );
  }
}
