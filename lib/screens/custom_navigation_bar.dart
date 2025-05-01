import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationBarApp extends StatefulWidget {
  // Esta clase representa una barra de navegación personalizada.


  const NavigationBarApp({
    Key? key,

  }) : super(key: key);

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  int currentIndex = 0; // Inicializa el índice actual a 0
  void goToRouteNavigation(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/alumnos');
        break;
      case 1:
        context.go('/fechasDePago');
        break;
      case 2:
        context.go('/deudores');
        break;
      default:
        context.go('/alumnos');
    }
  }
  @override
  Widget build(BuildContext context) {
    // Imprimir el valor actual y el callback (aunque este último solo
    // mostrará la referencia de la función)

    return NavigationBar(
      height: 60,
      selectedIndex: currentIndex,
      indicatorColor: Colors.blue,
      backgroundColor: Colors.redAccent,
      onDestinationSelected: (int index) {
        setState((){
          currentIndex = index;
        });
        goToRouteNavigation(index,context);
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.people_alt_rounded),
          label: 'Alumnos',
        ),
        NavigationDestination(
          icon: Icon(Icons.money_off_rounded),
          label: 'Deudores',
          
        ),
      ],
    );
  }
}