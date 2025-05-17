// go_router/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_gym/objetos/alumno.dart';
import '../screens/alumnos.dart';
import '../screens/finanzas.dart';
import '../screens/gastos.dart';
import '../screens/deudores.dart';
import 'package:sistema_gym/screens/precios.dart';
import 'package:sistema_gym/screens/fechas_de_pago.dart';
import 'package:sistema_gym/screens/disciplinas.dart';
import '../base_scaffold.dart';
import 'package:sistema_gym/objetos/disciplina.dart';
import 'package:sistema_gym/screens/plantilla_de_pago.dart';

final GoRouter router = GoRouter(
  initialLocation: '/alumnos',
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        // Usamos state.extra para el título, o un valor por defecto.
        final bool requiereBack = (state.matchedLocation == '/pagos' || state.matchedLocation == '/precios');

        // Para las rutas de /pagos y /precios usamos título fijo; en otras usamos extra si es String.
        late final String title;
        if (state.matchedLocation == '/pagos') {
          title = 'Pagos';
        } else if (state.matchedLocation == '/precios') {
          title = 'Precios';
        } else {
          title = state.extra is String ? state.extra as String : 'Le Groupe Gym';
        }

        // Si requiere botón de volver, no mostramos el drawer y configuramos un leading custom.
        final bool showDrawer = !requiereBack;
        final Widget? leadingWidget = requiereBack
            ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Si hay rutas en la pila, se hace pop; 
                // de lo contrario, se usa GoRouter para determinar la ubicación actual
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  final currentLocation = GoRouter.of(context).location;
                  if (currentLocation.contains('/pagos')) {
                    // Si estás en la página de pagos, redirige a la ruta que deseas (por ejemplo, '/alumnos')
                    context.go('/alumnos');
                  } else if (currentLocation.contains('/precios')) {
                    // Si estás en la página de precios, redirige a otra ruta, por ejemplo, '/disciplinas'
                    context.go('/disciplinas');
                  }
                }
              },
            )
            : null;



        // Definimos las acciones para el AppBar solo en la ruta `/alumnos`

        return BaseScaffold(
          title: title,
          showDrawer: showDrawer,
          leading: leadingWidget,
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