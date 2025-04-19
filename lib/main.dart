import 'package:flutter/material.dart';
import 'functions/rutas.dart';

void main() {
  runApp(const MyApp());
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
