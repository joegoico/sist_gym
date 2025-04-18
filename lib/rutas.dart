import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/alumnos.dart';
import 'screens/finanzas.dart';
import 'screens/precios.dart';
import 'screens/gastos.dart';
import 'screens/deudores.dart';
import 'screens/fechas_de_pago.dart';
import 'base_scaffold.dart';
import 'screens/custom_navigation_bar.dart';

int determineIndex(String location) {
  // Revisa si la ubicación coincide o comienza con cierta ruta.
  print("el indice es: $location");
  if (location.startsWith('/alumnos')) {
    return 0;
  } else if (location.startsWith('/fechasDePago')) {
    return 1;
  } else if (location.startsWith('/deudores')) {
    return 2;
  }
  // Devolver un valor por defecto, por ejemplo 0, si no coincide con ningún caso.
  return 0;
}
// Configuración de go_router
final GoRouter router = GoRouter(
  initialLocation: '/alumnos',  // o la ruta que desees iniciar
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        print("ShellRoute - currentLocation: ${state.location}");
        return BaseScaffold(
          title: 'Le Groupe Gym',
          // Aquí inyectas la barra de navegación "tonta":
          navigationBar: NavigationBarApp(
            currentIndex: determineIndex(state.location), // Función que mapea la ruta a un índice
            onDestinationSelected: (int newIndex) {
              // Dependiendo del índice, navega a la ruta correspondiente:
              print("route - Nuevo índice seleccionado desde la barra: $newIndex");
              switch (newIndex) {
                case 0:
                  context.go('/alumnos');
                  break;
                case 1:
                  context.go('/fechasDePago');
                  break;
                case 2:
                  context.go('/deudores');
                  break;
              }
            },
          ),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/alumnos',
          builder: (context, state) => const Alumnos(title: 'alumnos'), // Tu contenido de Alumnos sin Scaffold
        ),
        GoRoute(
          path: '/finanzas',
          builder: (context, state) => const Finanzas(), // Por ejemplo, el contenido de Fechas de Pago
        ),
        GoRoute(
          path: '/precios',
          builder: (context, state) => const Precios(), // Por ejemplo, el contenido de Fechas de Pago
        ),
        GoRoute(
          path: '/gastos',
          builder: (context, state) => const Gastos(),
        ),
         GoRoute(
          path: '/fechasDePago',
          builder: (context, state) => const FechasDePago(), // Por ejemplo, el contenido de Fechas de Pago
        ),
        GoRoute(
          path: '/deudores',
          builder: (context, state) => const Deudores(),
        )
      ],
    ),
  ],
);