import 'dart:convert';
import 'package:evaluacion_n2/models/ServicioModel.dart';
import 'package:evaluacion_n2/screens/DrawerWigdet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Serviciosscreen extends StatefulWidget {
  const Serviciosscreen({super.key});

  @override
  State<Serviciosscreen> createState() => _ServiciosScreenState();
}

class _ServiciosScreenState extends State<Serviciosscreen> {
  List<Servicio> _servicios = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _cargarServicios();
  }

  Future<void> _cargarServicios() async {
    try {
      final data = await rootBundle.loadString("assets/data/medico.json");
      final jsonList = json.decode(data);

      if (jsonList is List) {
        setState(() {
          _servicios = jsonList.map((json) => Servicio.fromJson(json)).toList();
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = "El JSON no es una lista de servicios.";
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = "Error al cargar servicios: $e";
        _isLoading = false;
      });
    }
  }

  void _mostrarInfo(Servicio servicio) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(servicio.nombre),
        content: Text(servicio.descripcion),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Servicios")),
      drawer: const AppDrawner(), // si usas Drawer
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Text(_error!))
          : ListView.builder(
              itemCount: _servicios.length,
              itemBuilder: (context, index) {
                final servicio = _servicios[index];
                return ListTile(
                  leading: Image.network(
                    servicio.imagen,
                    width: 50,
                    height: 50,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported);
                    },
                  ),
                  title: Text(servicio.nombre),
                  subtitle: Text(servicio.horario),
                  onTap: () => _mostrarInfo(servicio),
                );
              },
            ),
    );
  }
}
