
import 'dart:convert';

import 'package:evaluacion_n2/models/ServicioModel.dart';
import 'package:evaluacion_n2/screens/DrawerWigdet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Serviciosscreen extends StatefulWidget{
  const Serviciosscreen({super.key});

  @override
  State<Serviciosscreen> createState() => _ServiciosScreenState();
}

class _ServiciosScreenState extends State<Serviciosscreen>{
  List<Servicio> _servicios = [];

  @override
  void initState() {
    super.initState();
    _cargarServicios();
  }

  Future<void> _cargarServicios() async {
    final data = await rootBundle.loadString("assets/data/medico.json");
    final List<dynamic> jsonList = json.decode(data);

    setState(() {
      _servicios = jsonList.map((json) => Servicio.fromJson(json)).toList();
    });
  }

  void _mostrarInfo(Servicio servicio) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(servicio.nombre),
        content: Text(servicio.descripcion),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Servicios")),
      body: _servicios.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _servicios.length,
              itemBuilder: (context, index) {
                final servicio = _servicios[index];
                return ListTile(
                  leading: Image.network(servicio.imagen, width: 50, height: 50),
                  title: Text(servicio.nombre),
                  subtitle: Text(servicio.horario),
                  onTap: () => _mostrarInfo(servicio),
                );
              },
            ),
    );
  }
}
