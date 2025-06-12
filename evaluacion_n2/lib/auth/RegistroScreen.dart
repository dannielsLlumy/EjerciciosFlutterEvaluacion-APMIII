import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Registroscreen extends StatefulWidget {
  const Registroscreen({super.key});

  @override
  State<Registroscreen> createState() => _RegistroscreenState();
}

class _RegistroscreenState extends State<Registroscreen>{
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _registrarUsuario() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty){
      _mostrarAlerta("Por favor, ingresa tu correo y contraseña.");
      return;
    }

    try{
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        );

        if (response.user != null){
           _mostrarAlerta("Un registro exitoso! Ahora inicia sesión.");
        _emailController.clear();
        _passwordController.clear();
      }
    } catch (error) {
      _mostrarAlerta("Error al registrar: ${error.toString()}");
    }
  }

  void _mostrarAlerta(String mensaje) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("AVISO"),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("ACEPTAR"),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Correo electrónico"),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Contraseña"),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _registrarUsuario,
              child: const Text("Registrarse"),
            )
          ],
        ),
      ),
    );
  }
}
