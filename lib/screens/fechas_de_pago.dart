import 'package:flutter/material.dart';

class FechasDePago extends StatefulWidget {
  const FechasDePago({super.key});

  @override
  State<FechasDePago> createState() => _FechasDePagoState();
}
class _FechasDePagoState extends State<FechasDePago> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context); // Llama al método build de la clase padre
    return Center(
        child: Text(
          'Fechas de Pago',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );
  }
  @override
  bool get wantKeepAlive => true; // Mantiene el estado de la pestaña
}