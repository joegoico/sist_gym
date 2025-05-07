// This file contains the Alumno class, which represents a student in the system.
import 'package:sistema_gym/objetos/disciplina.dart';
import 'package:sistema_gym/objetos/pago.dart';
class Alumno {
  int _id;
  String _nombre;
  String _apellido;
  String _correoElectronico;
  Disciplina _disciplina;
  List<Pago> _pagosRealizados = [];

  Alumno({
    required int id,
    required String nombre,
    required String apellido,
    required String correoElectronico,
    required Disciplina disciplina,
  })  : _id = id,
        _nombre = nombre,
        _apellido = apellido,
        _correoElectronico = correoElectronico,
        _disciplina = disciplina;
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

  void agregarFechaDePago(Pago fechaDePago) {
    _pagosRealizados.add(fechaDePago);
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

  List<Pago> getPagosRealizados() {
    return _pagosRealizados;
  }
  int getId() {
    return _id;
  }
  Disciplina getDisciplina() {
    return _disciplina;
  }
}