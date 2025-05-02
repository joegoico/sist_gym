// modelo_alumnos.dart
import 'package:flutter/foundation.dart';
import 'package:sistema_gym/objetos/alumno.dart'; // Tu modelo Alumno

class AlumnosModel extends ChangeNotifier {
  final List<Alumno> _alumnos = [];

  List<Alumno> get alumnos => List.unmodifiable(_alumnos);

  void agregarAlumno(Alumno nuevoAlumno) {
    _alumnos.add(nuevoAlumno);

    notifyListeners();
  }

  void eliminarAlumno(Alumno alumno) {
    _alumnos.remove(alumno);
    notifyListeners();
  }
  void editarAlumno(Alumno alumno, Alumno nuevoAlumno) {
    int index = _alumnos.indexOf(alumno);
    if (index != -1) {
      _alumnos[index] = nuevoAlumno;
      notifyListeners();
    }
  }

  // Agrega otros métodos, como eliminar o editar, si los necesitas
}