import 'package:flutter/material.dart';

class Deudores extends StatefulWidget {
  const Deudores({super.key});

  @override
  State<Deudores> createState() => _DeudoresState();
}
class _DeudoresState extends State<Deudores> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Text(
          'Deudores',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}