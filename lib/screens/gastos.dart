import 'package:flutter/material.dart';
import 'package:sistema_gym/functions/formulario_gastos.dart';

class Gastos extends StatefulWidget {
  const Gastos({super.key});

  @override
  State<Gastos> createState() => _GastosState();
}
class _GastosState extends State<Gastos> {

  void _showNuevoGastoForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return const AgregarGastoForm();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
  return Stack(
    children: [
      // El contenido principal.
      Center(
        child: Text('Gastos',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
      // Posiciona el botón en la esquina inferior derecha.
      Positioned(
        right: 20,
        bottom: 20,
        child: 
          RawMaterialButton(
            onPressed: () {
              _showNuevoGastoForm(context);// Acción al presionar.
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