import 'package:flutter/material.dart';
import '../auth/LoginScreen.dart';
import '../auth/RegistroScreen.dart';


class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bienvenido")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Desarrollado por: Daniel Llumiquinga (@dannielsLlumy)",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Loginscreen()),
              ),
              child: const Text("Iniciar Sesión"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RegisterScreen()),
              ),
              child: const Text("Registrarse"),
            ),
          ],
        ),
      ),
    );
  }
}
