import 'package:flutter/material.dart';

class NavigationBarApp extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const NavigationBarApp({
    Key? key,
    required this.currentIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Imprimir el valor actual y el callback (aunque este último solo
    // mostrará la referencia de la función)

    return NavigationBar(
      height: 60,
      selectedIndex: currentIndex,
      onDestinationSelected: (int index) {
        print("Nuevo índice seleccionado desde la barra: $index");
        onDestinationSelected(index);
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.school),
          label: 'Alumnos',
        ),
        NavigationDestination(
          icon: Icon(Icons.payment),
          label: 'Fechas de Pago',
        ),
        NavigationDestination(
          icon: Icon(Icons.warning),
          label: 'Deudores',
        ),
      ],
    );
  }
}