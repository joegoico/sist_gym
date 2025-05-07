import 'package:flutter/material.dart';
import 'package:sistema_gym/objetos/alumno.dart';
import 'package:sistema_gym/objetos/pago.dart';
import 'package:intl/intl.dart';


class FechasDePago extends StatefulWidget {
  final Alumno alumno;
  const FechasDePago({super.key, required this.alumno});

  @override
  State<FechasDePago> createState() => _FechasDePagoState();
}
class _FechasDePagoState extends State<FechasDePago>  {
  @override
  Widget build(BuildContext context) {
    final List<Pago> fechasDePago = widget.alumno.getPagosRealizados();
    return Scaffold(
        body: fechasDePago.isEmpty
            ? const Center(
                child: Text(
                  "No hay pagos realizados",
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: fechasDePago.length,
                itemBuilder: (context, index) {
                  final pago = fechasDePago[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('${DateFormat('dd/MM/yyyy').format(pago.getFechaDePago())}'),
                          subtitle: Text('${pago.getMonto()} ARS'),
                        ),
                      ],
                    ),
                  );
                },
              )
      );
  }
 // Mantiene el estado de la pestaña
}