import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/environment_config.dart';

class ApiService {
  static final String baseUrl = EnvironmentConfig.apiUrl;

  static Future<String> testConnection() async {
    try {
    final response = await http.get(Uri.parse('$baseUrl/'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['message'] ?? 'Conexión exitosa';
      } else {
        return 'Error del servidor: ${response.statusCode}';
      }
    } catch (e) {
      throw Exception('No se pudo conectar con la API: $e');
    }
  }
}