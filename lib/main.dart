import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'rutas.dart'; // Tus rutas definidas
import 'package:sistema_gym/providers/alumnos_provider.dart';
import 'package:sistema_gym/providers/gastos_provider.dart';
import 'package:sistema_gym/providers/disciplinas_provider.dart';
import 'package:sistema_gym/providers/finanzas_provider.dart';
import 'package:sistema_gym/providers/theme_provider.dart'; // Importa tu notifier
import 'package:logging/logging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es_ES', null);

  // Configurar logging
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
    if (record.error != null) {
      print('Error: ${record.error}');
      print('Stack trace: ${record.stackTrace}');
    }
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AlumnosModel>(
          create: (_) => AlumnosModel(),
        ),
        ChangeNotifierProvider<GastosProvider>(
          create: (_) => GastosProvider(),
        ),
        ChangeNotifierProvider<DisciplinasProvider>(
          create: (_) => DisciplinasProvider(),
        ),
        ChangeNotifierProvider<FinanzasProvider>(
          create: (_) => FinanzasProvider(),
        ),
        ChangeNotifierProvider<AppThemeNotifier>(
          create: (_) => AppThemeNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtén el estado del tema mediante el provider.
    final themeNotifier = Provider.of<AppThemeNotifier>(context);

    // Configuración para el tema claro (lo que ya tenías configurado).
    final ColorScheme lightColorScheme = ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      brightness: Brightness.light,
    );
    final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.primary,
      ),
    );

    // Configuración para el tema oscuro, puedes personalizarla a tu gusto.
    final ColorScheme darkColorScheme = ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      brightness: Brightness.dark,
    );
    final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: darkColorScheme.primary,
      ),
    );

    return MaterialApp.router(
      title: 'Le Groupe Gym',
      theme: lightTheme,     // Tema claro según tu configuración
      darkTheme: darkTheme,  // Tema oscuro definido
      themeMode: themeNotifier.currentThemeMode, // Se determina en función del estado
      routerConfig: router,  // Tus rutas definidas
    );
  }
}