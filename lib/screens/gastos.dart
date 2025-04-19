import 'package:flutter/material.dart';

class Gastos extends StatefulWidget {
  const Gastos({super.key});

  @override
  State<Gastos> createState() => _GastosState();
}
class _GastosState extends State<Gastos> {
  @override
  Widget build(BuildContext context) {
  return Stack(
    children: [
      // El contenido principal.
      Center(child: Text('Contenido principal')),
      // Posiciona el botón en la esquina inferior derecha.
      Positioned(
        right: 20,
        bottom: 20,
        child: 
          RawMaterialButton(
            onPressed: () {
              // Acción al presionar.
            },
            elevation: 2.0,
            fillColor: Colors.blue,
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
            child: Icon(
              Icons.add,
              size: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}