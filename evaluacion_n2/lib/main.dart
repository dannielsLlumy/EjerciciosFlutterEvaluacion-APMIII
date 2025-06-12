
import 'package:flutter/material.dart';
import 'package:evaluacion_n2/screens/welcome_screen.dart';

void main(){
  runApp(EvaluacionN2());
}

class EvaluacionN2 extends StatelessWidget {
  const EvaluacionN2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Citas Médicas",
      home: WelcomeScreen(),
    );
  }
}