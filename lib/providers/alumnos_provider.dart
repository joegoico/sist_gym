// modelo_alumnos.dart
import 'package:flutter/foundation.dart';
import 'package:sistema_gym/objetos/alumno.dart'; // Tu modelo Alumno

class AlumnosModel extends ChangeNotifier {
  final List<Alumno> _alumnos = [];

  List<Alumno> get alumnos => List.unmodifiable(_alumnos);

  void agregarAlumno(Alumno nuevoAlumno) {
    _alumnos.add(nuevoAlumno);
    print("Alumno agregado: ${nuevoAlumno.nombre} ${nuevoAlumno.apellido}");
    notifyListeners();
  }

  void eliminarAlumno(Alumno alumno) {
    _alumnos.remove(alumno);
    print("Alumno eliminado: ${alumno.nombre} ${alumno.apellido}");
    notifyListeners();
  }

  // Agrega otros métodos, como eliminar o editar, si los necesitas
}