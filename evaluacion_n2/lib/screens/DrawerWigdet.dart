
import 'package:evaluacion_n2/auth/LoginScreen.dart';
import 'package:evaluacion_n2/screens/CitasScreen.dart';
import 'package:evaluacion_n2/screens/ServiciosScreen.dart';
import 'package:flutter/material.dart';

class AppDrawner extends StatelessWidget{
  const AppDrawner({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text("Menu"),
            ),
            ListTile(
              title: const Text("Citas Médicas"),
              onTap: (){
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (_) => const CitasScreen()),
                  );
              },
            ),
            ListTile(
              title: const Text("Servicios"),
              onTap: (){
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (_) => const Serviciosscreen()),
                  );
              },
            ),
            ListTile(
            title: const Text('Cerrar Sesión'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}