
import 'dart:convert';
import 'package:evaluacion_n2/screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:supabase_flutter/supabase_flutter.dart';

List<dynamic> serviciosMedicos = []; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Supabase
  await Supabase.initialize(
    url: 'https://ozreitllxafwvweketpo.supabase.co', 
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im96cmVpdGxseGFmd3Z3ZWtldHBvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk3MzM4NzAsImV4cCI6MjA2NTMwOTg3MH0.M3gb_BDJEZ2zBrt44I4c6iPaGpB43jZRvhkPO5BHvLY', 
  );

  // Cargar el archivo JSON desde assets
  final String response = await rootBundle.loadString('assets/data/medico.json');
  final data = await json.decode(response);
  serviciosMedicos = data["servicio_medico"]; 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Citas Médicas",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Welcomescreen(),
    );
  }
}
