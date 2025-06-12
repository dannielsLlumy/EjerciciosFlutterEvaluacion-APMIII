
import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget{
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Iniciar Sesión")),
      body: const Center(child: Text("Pantalla de Login")),
    );
  }
}