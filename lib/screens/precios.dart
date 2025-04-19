import 'package:flutter/material.dart';
import 'package:sistema_gym/functions/formulario_precios.dart';
class Precios extends StatefulWidget {
  const Precios({super.key});

  @override
  State<Precios> createState() => _PreciosState();
}
class _PreciosState extends State<Precios> {

  void _showNuevoPrecioForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return const NuevoPagoForm();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // El contenido principal.
        Center(
          child: Text('Precios',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        // Posiciona el botón en la esquina inferior derecha.
        Positioned(
          right: 20,
          bottom: 20,
          child: RawMaterialButton(
            onPressed: () {
              _showNuevoPrecioForm(context );// Acción al presionar el botón
            },
            elevation: 2.0,
            fillColor: const Color.fromARGB(255, 146, 181, 209),
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