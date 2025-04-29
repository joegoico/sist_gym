import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/alumnos.dart';
import '../screens/finanzas.dart';
import '../screens/precios.dart';
import '../screens/gastos.dart';
import '../screens/deudores.dart';
import '../screens/fechas_de_pago.dart';
import 'package:sistema_gym/screens/disciplinas.dart';
import '../base_scaffold.dart';

// Configuración de go_router
final GoRouter router = GoRouter(
  initialLocation: '/alumnos',  // o la ruta que desees iniciar
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return BaseScaffold(
          title: 'Le Groupe Gym',
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
        ),
        GoRoute(
          path: '/disciplinas',
          builder: (context, state) => const DiscplinasPage(title: 'Disciplinas'), // Por ejemplo, el contenido de Fechas de Pago
        )
      ],
    ),
  ],
);