import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentConfig {
  static String get apiUrl => dotenv.env['API_URL'] ?? 'http://localhost:3000';
}