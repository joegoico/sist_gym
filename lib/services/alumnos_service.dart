import '../config/api_config.dart';
import 'api_service.dart';

class AlumnosService extends ApiService {
  AlumnosService() : super(ApiConfig.alumnos);
  
  // Puedes agregar métodos específicos para alumnos aquí si es necesario
  Future<List<Map<String, dynamic>>> getAlumnosByGymId(int gymId) async {
    return await getById(gymId.toString());
  }
} 