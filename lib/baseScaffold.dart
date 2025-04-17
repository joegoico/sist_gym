import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/custom_navigation_bar.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? navigationBar; // propiedad opcional para la Navigation Bar // propiedad opcional para el FAB

  const BaseScaffold({
    Key? key,
    required this.title,
    required this.child,
    this.navigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar común
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(title),
      ),
      // Drawer común
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 195, 225, 233),
        elevation: 16,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(235, 30, 148, 132),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/logo.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Le Groupe Gym',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Finanzas'),
              onTap: () => context.go('/finanzas'),
            ),
            ListTile(
              title: const Text('Precios'),
              onTap: () => context.go('/precios'),
            ),
            ListTile(
              title: const Text('Gastos'),
              onTap: () => context.go('/gastos'),
            ),
          ],
        ),
      ),
      // Contenido variable
      //body: child,
      // NavigationBar opcional
      bottomNavigationBar: const NavigationBarApp(), // Si no se proporciona, se usa la Navigation Bar por defecto
    );
  }
}