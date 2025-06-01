// modelo_alumnos.dart
import 'package:flutter/foundation.dart';
import 'package:sistema_gym/objetos/alumno.dart';
import 'package:sistema_gym/objetos/pago.dart';
import 'package:sistema_gym/services/alumnos_service.dart';

class AlumnosModel extends ChangeNotifier {
  final List<Alumno> _alumnos = [];
  final AlumnosService _alumnosService = AlumnosService();
  bool _isLoading = false;

  List<Alumno> get alumnos => List.unmodifiable(_alumnos);
  bool get isLoading => _isLoading;

  // Cargar alumnos desde el backend
  Future<void> cargarAlumnos() async {
    _isLoading = true;
    notifyListeners();

    try {
      final alumnosFromServer = await _alumnosService.getAlumnosByGymId(1);
      _alumnos.clear();
      _alumnos.addAll(alumnosFromServer);
    } catch (e) {
      print('Error al cargar alumnos: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> agregarAlumno(Alumno nuevoAlumno) async {
    try {
      final alumnoCreado = await _alumnosService.crearAlumno(nuevoAlumno);
      _alumnos.add(alumnoCreado);
      notifyListeners();
    } catch (e) {
      print('Error al agregar alumno: $e');
      rethrow;
    }
  }

  Future<void> eliminarAlumno(Alumno alumno) async {
    try {
      await _alumnosService.eliminarAlumno(alumno.getId());
      _alumnos.remove(alumno);
      notifyListeners();
    } catch (e) {
      print('Error al eliminar alumno: $e');
      rethrow;
    }
  }

  Future<void> editarAlumno(Alumno alumno, Alumno nuevoAlumno) async {
    try {
      final alumnoActualizado = await _alumnosService.actualizarAlumno(nuevoAlumno);
      int index = _alumnos.indexOf(alumno);
      if (index != -1) {
        _alumnos[index] = alumnoActualizado;
        notifyListeners();
      }
    } catch (e) {
      print('Error al editar alumno: $e');
      rethrow;
    }
  }

  void updatePago(Alumno alumno, List<Pago> pagosActualizados) {
    int index = _alumnos.indexOf(alumno);
    if (index != -1) {
      _alumnos[index].actualizarPagos(pagosActualizados);
      notifyListeners();
    }
  }

// Agrega otros métodos, como eliminar o editar, si los necesitas
}