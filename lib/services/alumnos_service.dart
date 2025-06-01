import '../config/api_config.dart';
import 'api_service.dart';
import '../objetos/alumno.dart';
import '../objetos/disciplina.dart';

class AlumnosService extends ApiService {
  AlumnosService() : super(ApiConfig.alumnos);
  
  // Obtener alumnos por gimnasio
  Future<List<Alumno>> getAlumnosByGymId(int gymId) async {
    final response = await getById(gymId.toString());
    return _convertirResponseAAlumnos(response);
  }

  // Crear un nuevo alumno
  Future<Alumno> crearAlumno(Alumno alumno) async {
    final data = _convertirAlumnoAMap(alumno);
    final response = await create(data);
    return _convertirResponseAAlumno(response);
  }

  // Actualizar un alumno existente
  Future<Alumno> actualizarAlumno(Alumno alumno) async {
    final data = _convertirAlumnoAMap(alumno);
    final response = await update(alumno.getId().toString(), data);
    return _convertirResponseAAlumno(response);
  }

  // Eliminar un alumno
  Future<void> eliminarAlumno(int id) async {
    await delete(id.toString());
  }

  // Métodos auxiliares para convertir entre formatos
  Map<String, dynamic> _convertirAlumnoAMap(Alumno alumno) {
    return {
      'id': alumno.getId(),
      'nombre': alumno.getNombre(),
      'apellido': alumno.getApellido(),
      'correo_electronico': alumno.getCorreoElectronico(),
      'disciplina_id': alumno.getDisciplina().getId(),
    };
  }

  Alumno _convertirResponseAAlumno(Map<String, dynamic> data) {
    return Alumno(
      id: data['id'],
      nombre: data['nombre'],
      apellido: data['apellido'],
      correoElectronico: data['correo_electronico'],
      disciplina: Disciplina(
        id: data['disciplina']['id'],
        nombre: data['disciplina']['nombre'],
      ),
    );
  }

  List<Alumno> _convertirResponseAAlumnos(List<dynamic> response) {
    return response.map((data) => _convertirResponseAAlumno(data as Map<String, dynamic>)).toList();
  }
} 