import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_gym/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget{
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<AppThemeNotifier>(context);
    final theme = Theme.of(context);
    return Drawer(
      backgroundColor: theme.colorScheme.surface,
      elevation: 16,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Text(
                  'Le Groupe Gym',
                  style: TextStyle(color: theme.colorScheme.onTertiary, fontSize: 24),
                ),
              ],
            ),
          ),
          ListTile(
              leading:  Icon(Icons.query_stats_rounded,color: theme.colorScheme.onSurface),
              title:
              Text('Finanzas',style: TextStyle(color: theme.colorScheme.onSurface)),
              onTap: () {
                Navigator.of(context).pop(); // Cierra el Drawer antes de navegar
                context.go('/finanzas', extra: 'Finanzas');
              }

          ),
          ListTile(
              leading:  Icon(Icons.sports_gymnastics,color: theme.colorScheme.onSurface),
              title: Text('Disciplinas',style: TextStyle(color: theme.colorScheme.onSurface)),
              onTap: () {
                Navigator.of(context).pop(); // Cierra el Drawer antes de navegar
                context.go('/disciplinas', extra: 'Disciplinas');
              }
          ),
          ListTile(
              leading:  Icon(Icons.payments_rounded,color: theme.colorScheme.onSurface),
              title:  Text('Gastos',style: TextStyle(color: theme.colorScheme.onSurface)),
              onTap: () {
                Navigator.of(context).pop(); // Cierra el Drawer antes de navegar
                context.go('/gastos', extra: 'Gastos');
              }
          ),
          Divider(height: 5.0,color: theme.colorScheme.outlineVariant),
          ListTile(
              leading:  Icon(Icons.payment_outlined,color: theme.colorScheme.onSurface),
              title:   Text('Pagar suscripcion',style: TextStyle(color: theme.colorScheme.onSurface)),
              onTap: () {
                Navigator.of(context).pop(); // Cierra el Drawer antes de navegar
                context.go('/metodoDePago', extra: 'Suscripcion');
              }

          ),
          Divider(height: 5.0,color: theme.colorScheme.outlineVariant),
          SwitchListTile(
            title: const Text("Tema oscuro"),
            value: themeNotifier.isDarkTheme,
            onChanged: (value) {
              themeNotifier.toggleTheme(value);
            },
          ),

        ],
      ),
    );
  }
}