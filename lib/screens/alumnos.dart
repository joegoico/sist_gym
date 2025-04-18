import 'package:flutter/material.dart';

class Alumnos extends StatefulWidget {
  const Alumnos({super.key, required this.title});

  final String title;

  @override
  State<Alumnos> createState() => _AlumnosState();
}

class _AlumnosState extends State<Alumnos> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Center(  // Usamos "child" en lugar de "body"
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ 
              Text('Has presionado el botón esta cantidad de veces:',),
            ],
          ),
        ),
        
      );
  }
}
