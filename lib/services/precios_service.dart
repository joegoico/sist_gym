import 'package:sistema_gym/services/api_service.dart';
import 'package:sistema_gym/config/api_config.dart';
import 'package:sistema_gym/objetos/precio.dart';
import 'package:logging/logging.dart';

class PreciosService extends ApiService {
  final _logger = Logger('PreciosService');
  PreciosService() : super(ApiConfig.precios);

  Future<List<Precio>> getPreciosByDisciplinaId(int disciplinaId) async {
    try {
      final response = await getById(disciplinaId.toString());
      return Precio.listFromJson(response);
    } catch (e) {
      _logger.severe('Error al obtener precios por disciplina ID: $e');
      rethrow;
    }
  }

  Future<Precio> getPrecioById(int precioId) async {
    try {
      final response = await getById(precioId.toString());
      return Precio.fromJson(response);
    } catch (e) {
      _logger.severe('Error al obtener precio por ID: $e');
      rethrow;
    }
  }

  Future<Precio> createPrecio(Precio precio) async {
    try {
      final response = await create(precio.toJson()); 
      return Precio.fromJson(response);
    } catch (e) {
      _logger.severe('Error al crear precio: $e');
      rethrow;
    }
  }

  Future<Precio> updatePrecio(Precio precio) async {
    try {
      final response = await update(precio.getId().toString(), precio.toJson());
      return Precio.fromJson(response);
    } catch (e) {
      _logger.severe('Error al actualizar precio: $e');
      rethrow;
    }
  }

  Future<void> deletePrecio(int precioId) async {
    try {
      await delete(precioId.toString());
    } catch (e) {
      _logger.severe('Error al eliminar precio: $e');
      rethrow;
    }
  }
}

