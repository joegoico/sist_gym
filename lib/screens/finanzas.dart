import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sistema_gym/providers/finanzas_provider.dart';
import 'package:sistema_gym/providers/gastos_provider.dart';


class Finanzas extends StatefulWidget {
  const Finanzas({super.key});

  @override
  State<Finanzas> createState() => _FinanzasState();
}
class _FinanzasState extends State<Finanzas> {
  @override
  Widget build(BuildContext context) {
  final finanzasProvider = Provider.of<FinanzasProvider>(context).pagosPorMes; 
  final gastosProvider = Provider.of<GastosProvider>(context).gastosPorMes;

    // Mapa para convertir nombres de meses a números.
    // Esto es útil para ordenar los meses correctamente.

   final List<String> mesesFijos = [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre',
    ];

    return  ListView.builder(
      shrinkWrap: true,
      itemCount: mesesFijos.length,
      itemBuilder: (context, index) {
        final mes = mesesFijos[index];
        final double montoDelMes = finanzasProvider[mes] ?? 0.0;
        final double gastosDelMes = gastosProvider[mes]
          ?.fold(0.0, (sum, gasto) => sum! + (gasto.getMonto() ?? 0.0)) ?? 0.0;
        
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ExpansionTile(
            title: Text(
              mes,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Balance del mes de $mes : \$${(montoDelMes - gastosDelMes).toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 16),
            ),
            children: [
              ListTile(
                title: Text("Total Ingresos: \$${montoDelMes.toStringAsFixed(2)}"),
              ),
              ListTile(
                title: Text("Total Gastos: \$${gastosDelMes.toStringAsFixed(2)}"),
                trailing: ElevatedButton(
                  onPressed: () => context.go('/gastos'), 
                  child: Text("Ver gastos") ),
              ),
            ],
          ),

        );
      },
    );
  }
}