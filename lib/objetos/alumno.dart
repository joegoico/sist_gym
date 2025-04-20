import 'package:flutter/material.dart';

class Alumno {
  String nombre;
  String apellido;
  String correoElectronico;
  int candidadDias;
  DateTime fechaUltimoPago;
  bool descuento = false;

  Alumno({
    required this.nombre,
    required this.apellido,
    required this.correoElectronico,
    required this.candidadDias,
    required this.fechaUltimoPago,
    required this.descuento,
  });
}