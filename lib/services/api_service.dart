import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import 'package:logging/logging.dart';

class ApiService {
  final String endpoint;
  final _logger = Logger('ApiService');
  
  ApiService(this.endpoint);
  
  Future<dynamic> getAll() async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}$endpoint');
      _logger.info('GET request to: $url');
      
      final response = await http.get(url);
      _logger.info('Response status: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      throw Exception('Error ${response.statusCode}: ${response.body}');
    } catch (e) {
      _logger.severe('Error en getAll: $e');
      rethrow;
    }
  }

  Future<dynamic> getByInstitucionId(String institucionId) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}$endpoint/institucion/$institucionId');
      //_logger.info('GET request to: $url');
      
      return http
      .get(url)
      .timeout(const Duration(seconds: 5), onTimeout: () => throw Exception('Timeout: $url'));
      //_logger.info('Response status: ${response.statusCode}');
    } catch (e) {
      _logger.severe('Error en getByInstitucionId: $e');
      rethrow;
    }
  }

  Future<dynamic> getById(String id) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}$endpoint/$id');
      _logger.info('GET request to: $url');
      
      final response = await http.get(url);
      _logger.info('Response status: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      throw Exception('Error ${response.statusCode}: ${response.body}');
    } catch (e) {
      _logger.severe('Error en getById: $e');
      rethrow;
    }
  }

  Future<dynamic> create(Map<String, dynamic> data) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}$endpoint');
      _logger.info('POST request to: $url');
      
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      _logger.info('Response status: ${response.statusCode}');
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      }
      throw Exception('Error ${response.statusCode}: ${response.body}');
    } catch (e) {
      _logger.severe('Error en create: $e');
      rethrow;
    }
  }

  Future<dynamic> update(String id, Map<String, dynamic> data) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}$endpoint/$id');
      _logger.info('PUT request to: $url');
      
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      _logger.info('Response status: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      throw Exception('Error ${response.statusCode}: ${response.body}');
    } catch (e) {
      _logger.severe('Error en update: $e');
      rethrow;
    }
  }

  Future<void> delete(String id) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}$endpoint/$id');
      _logger.info('DELETE request to: $url');
      
      final response = await http.delete(url);
      _logger.info('Response status: ${response.statusCode}');
      
      if (response.statusCode != 204) {
        throw Exception('Error ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      _logger.severe('Error en delete: $e');
      rethrow;
    }
  }
} 