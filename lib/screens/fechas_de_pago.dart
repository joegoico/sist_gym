import 'package:flutter/material.dart';

class FechasDePago extends StatefulWidget {
  const FechasDePago({super.key});

  @override
  State<FechasDePago> createState() => _FechasDePagoState();
}
class _FechasDePagoState extends State<FechasDePago> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          'Fechas de Pago',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );
  }
}