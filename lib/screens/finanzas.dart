import 'package:flutter/material.dart';


class Finanzas extends StatefulWidget {
  const Finanzas({super.key});

  @override
  State<Finanzas> createState() => _FinanzasState();
}
class _FinanzasState extends State<Finanzas> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          'Finanzas',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );
  }
}