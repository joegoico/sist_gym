import '../config/api_config.dart';
import 'api_service.dart';
import '../objetos/alumno.dart';
import 'package:logging/logging.dart';

class AlumnosService extends ApiService {
  final _logger = Logger('AlumnosService');
  
  AlumnosService() : super(ApiConfig.alumnos);
  
  // Obtener alumnos por institución
  Future<List<Alumno>> getAlumnosByInstitucionId(int institucionId) async {
    try {
      _logger.info('Obteniendo alumnos para la institución ID: $institucionId');
      final response = await getByInstitucionId(institucionId.toString());
      
      if (response == null) {
        throw Exception('La respuesta del servidor es nula');
      }
      
      if (response is! List) {
        _logger.severe('Respuesta inesperada del servidor: $response');
        throw Exception('La respuesta del servidor no es una lista');
      }
      
      _logger.info('Respuesta del servidor para la institución $institucionId: $response');
      return Alumno.listFromJson(response);
    } catch (e) {
      _logger.severe('Error al obtener alumnos de la institución $institucionId: $e');
      rethrow;
    }
  }

  // Crear un nuevo alumno
  Future<Alumno> crearAlumno(Alumno alumno) async {
    try {
      final data = alumno.toJson();
      _logger.info('Enviando datos para crear alumno: $data');
      
      final response = await create(data);
      _logger.info('Respuesta al crear alumno: $response');
      
      return Alumno.fromJson(response);
    } catch (e) {
      _logger.severe('Error al crear alumno: $e');
      rethrow;
    }
  }

  // Actualizar un alumno existente
  Future<Alumno> actualizarAlumno(Alumno alumno) async {
    try {
      final data = alumno.toJson();
      final response = await update(alumno.getId().toString(), data);
      return Alumno.fromJson(response);
    } catch (e) {
      _logger.severe('Error al actualizar alumno: $e');
      rethrow;
    }
  }

  // Eliminar un alumno
  Future<void> eliminarAlumno(int id) async {
    try {
      await delete(id.toString());
    } catch (e) {
      _logger.severe('Error al eliminar alumno: $e');
      rethrow;
    }
  }
} 