import 'package:flutter/material.dart';

class Deudores extends StatefulWidget {
  const Deudores({super.key});

  @override
  State<Deudores> createState() => _DeudoresState();
}
class _DeudoresState extends State<Deudores> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context); // Llama al método build de la clase padre
    return Center(
      child: Center(
        child: Text(
          'Deudores',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
  @override
  bool get wantKeepAlive => true; // Mantiene el estado de la pestaña
}