// This file contains the Alumno class, which represents a student in the system.
import 'package:sistema_gym/objetos/disciplina.dart';
import 'package:sistema_gym/objetos/pago.dart';
import 'package:sistema_gym/objetos/precio.dart';
class Alumno {
  int _id;
  String _nombre;
  String _apellido;
  String _correoElectronico;
  Disciplina _disciplina;
  Precio _cuota;
  DateTime _fechaUltimoPago;
  bool _descuento = false;
  List<Pago> _pagosRealizados = [];

  Alumno({
    required int id,
    required String nombre,
    required String apellido,
    required String correoElectronico,
    required Disciplina disciplina,
    required Precio cuota,
    required DateTime fechaUltimoPago,
    bool descuento = false,
  })  : _id = id,
        _nombre = nombre,
        _apellido = apellido,
        _correoElectronico = correoElectronico,
        _disciplina = disciplina,
        _cuota = cuota,
        _fechaUltimoPago = fechaUltimoPago,
        _descuento = descuento;
  void setId(int id) {
    _id = id;
  }
  void setDisciplina(Disciplina disciplina) {
    _disciplina = disciplina;
  }        
  void setNombre(String nombre) {
    _nombre = nombre;
  }
  void setApellido(String apellido) {
    _apellido = apellido;
  }
  void setCorreoElectronico(String correoElectronico) {
    _correoElectronico = correoElectronico;
  }

  void setFechaUltimoPago(DateTime fechaUltimoPago) {
    _fechaUltimoPago = fechaUltimoPago;
  }
  void setDescuento(bool descuento) {
    _descuento = descuento;
  }
  void agregarFechaDePago(Pago fechaDePago) {
    _pagosRealizados.add(fechaDePago);
  }
  void setCuota(Precio cuota) {
    _cuota = cuota;
  }

  String getNombre() {
    return _nombre;
  }
  String getApellido() {
    return _apellido;
  }
  String getCorreoElectronico() {
    return _correoElectronico;
  }
  DateTime getFechaUltimoPago() {
    return _fechaUltimoPago;
  }
  bool getDescuento() {
    return _descuento;
  }
  List<Pago> getPagosRealizados() {
    return _pagosRealizados;
  }
  int getId() {
    return _id;
  }
  Precio getCuota() {
    return _cuota;
  }
  Disciplina getDisciplina() {
    return _disciplina;
  }
}