import 'package:flutter/material.dart';

class Gastos extends StatefulWidget {
  const Gastos({super.key});

  @override
  State<Gastos> createState() => _GastosState();
}
class _GastosState extends State<Gastos> {
  @override
  Widget build(BuildContext context) {
  return Center(
     child: Text(
           'Gastos',
           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
         ),
    );
  }
}