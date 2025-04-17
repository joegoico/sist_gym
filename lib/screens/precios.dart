import 'package:flutter/material.dart';

class Precios extends StatefulWidget {
  const Precios({super.key});

  @override
  State<Precios> createState() => _PreciosState();
}
class _PreciosState extends State<Precios> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Precios',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}