import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'functions/rutas.dart'; // Tus rutas ya definidas
import 'package:sistema_gym/providers/alumnos_provider.dart';
import 'package:sistema_gym/providers/gastos_provider.dart';
import 'package:sistema_gym/providers/precios_provider.dart'; // El modelo de alumnos que creamos

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AlumnosModel>(create: (_) => AlumnosModel(),),
        ChangeNotifierProvider<GastosProvider>(create: (_) => GastosProvider(),),
        ChangeNotifierProvider<PreciosProvider>(create: (_) => PreciosProvider(),),
        // Puedes agregar más providers aquí si es necesario
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Le Groupe Gym',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 34, 111, 121),
        ),
      ),
      routerConfig: router, // Usamos el widget que integra las pestañas con TabBar/TabBarView
    );
  }
}