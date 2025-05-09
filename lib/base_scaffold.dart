import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/custom_navigation_bar.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? customBottomNavigationBar; // propiedad opcional para la Navigation Bar // propiedad opcional para el FAB
  final Widget? leading;
  final bool showDrawer; // propiedad opcional para el Drawer

  const BaseScaffold({
    super.key,
    required this.title,
    required this.child,
    required this.showDrawer,
    this.customBottomNavigationBar,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      // AppBar común
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(title),
        // Si se inyecta un widget leading, se usa; de lo contrario,
        // se genera el ícono de menú (drawer) si showDrawer es true.
        leading: leading ??
            (showDrawer
                ? Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  )
                : null),
      ),

      // Drawer común
      drawer: showDrawer ?  
        Drawer(
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
                  SizedBox(height: 10),
                  Text(
                    'Le Groupe Gym',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.query_stats_rounded),
              title: const Text('Finanzas'),
              onTap: () {
                Navigator.of(context).pop(); // Cierra el Drawer antes de navegar
                context.go('/finanzas', extra: 'Finanzas');
              }
                
            ),
            ListTile(
              leading: const Icon(Icons.sports_gymnastics),
              title: const Text('Disciplinas'),
              onTap: () {
                Navigator.of(context).pop(); // Cierra el Drawer antes de navegar
                context.go('/disciplinas', extra: 'Disciplinas');
              }
            ),
            ListTile(
              leading: const Icon(Icons.payments_rounded),
              title: const Text('Gastos'),
              onTap: () {
                Navigator.of(context).pop(); // Cierra el Drawer antes de navegar
                context.go('/gastos', extra: 'Gastos');
              }
            ),
          ],
        ),
      ) : null, // Si no se necesita el Drawer, se establece en null
      // Contenido variable
    body: child,
    bottomNavigationBar: 
      CustomBottomNavigationBar(    
      ),
    );
  }
}