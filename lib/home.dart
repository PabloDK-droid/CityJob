import 'package:flutter/material.dart';

// Definicion de usuario
enum UserType { admin, soporte, profesionista, cliente }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserInterface(currentUser: UserType.admin), // Cambia el tipo aquí para probar ugu
    );
  }
}

class UserInterface extends StatelessWidget {
  final UserType currentUser;

  const UserInterface({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel de Mensajes')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: _buildUserMessage(),
        ),
      ),
    );
  }

  // Función de mensaje
  Widget _buildUserMessage() {
    switch (currentUser) {
      case UserType.admin:
        return const Text(
          'BIENVENIDO ADMIN: Tienes control total del sistema.',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        );
      case UserType.soporte:
        return const Text(
          'SOPORTE: Revisa los tickets pendientes de hoy.',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
        );
      case UserType.profesionista:
        return const Text(
          'PROFESIONISTA: Gestiona tus servicios y citas aquí.',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        );
      case UserType.cliente:
        return const Text(
          'CLIENTE: Revisa tus pedidos y perfil.',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        );
    }
  }
}
