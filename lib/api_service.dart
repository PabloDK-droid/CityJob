import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  // IP para emulador de Android: 10.0.2.2
  // navegador: localhost
static const String baseUrl = "http://localhost:3000";

  Future<void> testDatabaseConnection() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/test-db'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("¡Conexión Exitosa con PSQL!: ${data['time']}");
      } else {
        print("Error del servidor: ${response.statusCode}");
      }
    } catch (e) {
      print("No se pudo conectar al servidor: $e");
    }
  }
}