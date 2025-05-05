// go_router/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/alumnos.dart';
import '../screens/finanzas.dart';
import '../screens/gastos.dart';
import '../screens/deudores.dart';
import 'package:sistema_gym/screens/disciplinas.dart';
import '../base_scaffold.dart';

final GoRouter router = GoRouter(
  initialLocation: '/alumnos',
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        // Usamos state.extra para el título, o un valor por defecto.
        final String title = state.extra as String? ?? 'Le Groupe Gym';

        // Definimos las acciones para el AppBar solo en la ruta `/alumnos`

        return BaseScaffold(
          title: title,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/alumnos',
          builder: (context, state) => const Alumnos(title: 'Alumnos'),
        ),
        GoRoute(
          path: '/finanzas',
          builder: (context, state) => const Finanzas(),
        ),
        GoRoute(
          path: '/gastos',
          builder: (context, state) => const Gastos(),
        ),
        GoRoute(
          path: '/deudores',
          builder: (context, state) => const Deudores(),
        ),
        GoRoute(
          path: '/disciplinas',
          builder: (context, state) => const DiscplinasPage(title: 'Disciplinas'),
        ),
      ],
    ),
  ],
);