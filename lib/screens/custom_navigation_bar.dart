import 'package:flutter/material.dart';

class NavigationBarApp extends StatefulWidget {
  const NavigationBarApp({super.key});

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  int _currentIndex = 0;

  // Lista de páginas o la lógica de navegación puede gestionarse en otro nivel,
  // ya que aquí solo regresarás la barra propia.
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 60,
      selectedIndex: _currentIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _currentIndex = index;
          // Aquí podrías llamar a alguna función de navegación,
          // o notificar a un widget padre mediante un callback.
        });
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