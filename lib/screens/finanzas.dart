import 'package:flutter/material.dart';


class Finanzas extends StatefulWidget {
  const Finanzas({super.key});

  @override
  State<Finanzas> createState() => _FinanzasState();
}
class _FinanzasState extends State<Finanzas> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context); // Llama al método build de la clase padre
    return Center(
      child: Text(
          'Finanzas',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );
  }
  @override
  bool get wantKeepAlive => true; // Mantiene el estado de la pestaña
}