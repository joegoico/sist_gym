import 'package:flutter/material.dart';
import 'package:sistema_gym/functions/formulario_alumnos.dart';

class Alumnos extends StatefulWidget {
  const Alumnos({super.key, required this.title});

  final String title;

  @override
  State<Alumnos> createState() => _AlumnosState();
}

class _AlumnosState extends State<Alumnos> {

  void _showNuevoAlumnoForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return const NuevoAlumnoForm();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
    children: [
      // El contenido principal.
      Center(
        child: Text('Alumnos',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
      // Posiciona el botón en la esquina inferior derecha.
      Positioned(
        right: 20,
        bottom: 20,
        child: 
          RawMaterialButton(
            onPressed: () {
              _showNuevoAlumnoForm(context); // Llama a la función para mostrar el formulario
              // Acción al presionar el botón
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
