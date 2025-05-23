// go_router/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_gym/objetos/alumno.dart';
import 'screens/alumnos.dart';
import 'screens/finanzas.dart';
import 'screens/gastos.dart';
import 'screens/deudores.dart';
import 'package:sistema_gym/screens/precios.dart';
import 'package:sistema_gym/screens/fechas_de_pago.dart';
import 'package:sistema_gym/screens/disciplinas.dart';
import 'package:sistema_gym/custom_widgets/custom_shell_route.dart';
import 'package:sistema_gym/objetos/disciplina.dart';
import 'package:sistema_gym/screens/plantilla_de_pago.dart';

final GoRouter router = GoRouter(
  initialLocation: '/alumnos',
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ShellScaffoldWrapper(state: state, child: child);
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
        GoRoute(path: '/metodoDePago',
          builder: (context, state) => const PaymentScreen(hasDebt: true),
        ),
        GoRoute(
          path: '/pagos',
          builder: (context, state) {
            // Aquí extraemos la lista de pagos que se pasó en extra.
            final Alumno alumno = state.extra as Alumno;
            return FechasDePago(alumno: alumno);
          },
        ),
        GoRoute(path: '/precios', builder: (context, state){
          final Disciplina disciplina = state.extra as Disciplina;
          return PreciosPage(disciplina: disciplina);
        } ) // Aquí deberías pasar el alumno correspondiente
      ],
    ),
  ],
);