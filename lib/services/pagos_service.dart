import 'package:sistema_gym/objetos/pago.dart';
import 'package:sistema_gym/services/api_service.dart';
import 'package:sistema_gym/config/api_config.dart';
import 'package:logging/logging.dart';

class PagosService extends ApiService {
  final _logger = Logger('PagosService');

  PagosService() : super(ApiConfig.pagos);

  Future<List<Pago>> getPagosByAlumnoId(int alumnoId) async {
    try {
      final response = await getById(alumnoId.toString());
      return Pago.listFromJson(response);
    } catch (e) {
      _logger.severe('Error al obtener los pagos del alumno: $e');
      rethrow;
    }
  }
  
  Future<Pago> crearPago(Pago pago) async {
    try {
      final response = await create(pago.toJson());
      return Pago.fromJson(response);
    } catch (e) {
      _logger.severe('Error al crear el pago: $e');
      rethrow;
    }
  }

  Future<Pago> actualizarPago(Pago pago) async {
    try {
      final response = await update(pago.getId().toString(), pago.toJson());
      return Pago.fromJson(response);
    } catch (e) {
      _logger.severe('Error al actualizar el pago: $e');
      rethrow;
    }
  }

  Future<void> eliminarPago(Pago pago) async {
    try {
      await delete(pago.getId().toString());
    } catch (e) {
      _logger.severe('Error al eliminar el pago: $e');
      rethrow;
    }
  }
}