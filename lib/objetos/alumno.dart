import 'package:flutter/material.dart';

class Alumno {
  String nombre;
  String apellido;
  String correoElectronico;
  String fechaUltimoPago;
  double monto;

  Alumno({
    required this.nombre,
    required this.apellido,
    required this.correoElectronico,
    required this.fechaUltimoPago,
    required this.monto,
  });
}