import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class ApiService {
  final String endpoint;
  
  ApiService(this.endpoint);
  
  Future<dynamic> getAll() async {
    final response = await http.get(Uri.parse('${ApiConfig.baseUrl}$endpoint'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    throw Exception('Error al obtener datos');
  }

  Future<dynamic> getById(String id) async {
    final response = await http.get(Uri.parse('${ApiConfig.baseUrl}$endpoint/$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    throw Exception('Error al obtener el elemento');
  }

  Future<dynamic> create(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('${ApiConfig.baseUrl}$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    }
    throw Exception('Error al crear el elemento');
  }

  Future<dynamic> update(String id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('${ApiConfig.baseUrl}$endpoint/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    throw Exception('Error al actualizar el elemento');
  }

  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse('${ApiConfig.baseUrl}$endpoint/$id'));
    if (response.statusCode != 204) {
      throw Exception('Error al eliminar el elemento');
    }
  }
} 