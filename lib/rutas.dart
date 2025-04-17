import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/alumnos.dart';
import 'screens/finanzas.dart';
import 'screens/precios.dart';
import 'screens/gastos.dart';
import 'baseScaffold.dart';

// Configuración de go_router
final GoRouter router = GoRouter(
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return BaseScaffold(
          title: 'Le Groupe Gym',
          child: child,
          // Si tienes una navigation bar definida en otro archivo, la puedes inyectar aquí:
          // navigationBar: MyNavigationBar(...),
        );
      },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Alumnos(title: 'alumnos')),
      GoRoute(
        path: '/finanzas',
        builder: (context, state) => const Finanzas(),
      ),
      GoRoute(
        path: '/precios',
        builder: (context, state) => const Precios(),
      ),
      GoRoute(
        path: '/gastos',
        builder: (context, state) => const Gastos(),
      ),
    ],
    ),
  ]
);