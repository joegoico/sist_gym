
import 'package:sistema_gym/objetos/disciplina.dart';
import 'package:sistema_gym/objetos/fecha_pago.dart';
import 'package:sistema_gym/objetos/precio.dart';

class Alumno {
  int id;
  String nombre;
  String apellido;
  String correoElectronico;
  //Disciplina disciplina;
  DateTime fechaUltimoPago;
  bool descuento = false;
  List<Pago> pagosRealizados = [];

  Alumno({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.correoElectronico,
    //required this.cuota,
    required this.fechaUltimoPago,
    required this.descuento,
  });
  void setNombre(String nombre) {
    this.nombre = nombre;
  }
  void setApellido(String apellido) {
    this.apellido = apellido;
  }
  void setCorreoElectronico(String correoElectronico) {
    this.correoElectronico = correoElectronico;
  }

  void setFechaUltimoPago(DateTime fechaUltimoPago) {
    this.fechaUltimoPago = fechaUltimoPago;
  }
  void setDescuento(bool descuento) {
    this.descuento = descuento;
  }
  void agregarFechaDePago(Pago fechaDePago) {
    pagosRealizados.add(fechaDePago);
  }

  String getNombre() {
    return nombre;
  }
  String getApellido() {
    return apellido;
  }
  String getCorreoElectronico() {
    return correoElectronico;
  }
  DateTime getFechaUltimoPago() {
    return fechaUltimoPago;
  }
  bool getDescuento() {
    return descuento;
  }
}