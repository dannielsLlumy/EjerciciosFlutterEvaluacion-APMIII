import 'package:evaluacion_n2/screens/DrawerWigdet.dart';
import 'package:flutter/material.dart';

class CitasScreen extends StatefulWidget {
  const CitasScreen({super.key});

  @override
  State<CitasScreen> createState() => _CitasScreenState();
}

class _CitasScreenState extends State<CitasScreen> {
  final _idController = TextEditingController();
  final _especialidadController = TextEditingController();
  DateTime? _fechaSeleccionada;

  final List<Map<String, dynamic>> _citasGuardadas = [];

  void _guardarCita() {
    final id = _idController.text.trim();
    final especialidad = _especialidadController.text.trim();
    final fecha = _fechaSeleccionada;

    if (id.isEmpty || especialidad.isEmpty || fecha == null) {
      _mostrarAlerta("Completa todos los campos");
      return;
    }

    setState(() {
      _citasGuardadas.add({
        "id": id,
        "especialidad": especialidad,
        "fecha": fecha,
      });
    });

    _mostrarAlerta(
      "Cita guardada: ${id} ${especialidad} ${fecha.toLocal().toString().split(" ")[0]}",
    );

    _idController.clear();
    _especialidadController.clear();
    setState(() {
      _fechaSeleccionada = null;
    });
  }

  void _verCitasGuardadas() {
    if (_citasGuardadas.isEmpty) {
      _mostrarAlerta("No hay citas registradas.");
      return;
    }

    final mensaje = _citasGuardadas.map((cita) {
      return "ID: ${cita["id"]}, Especialidad: ${cita["especialidad"]}, Fecha: ${cita["fecha"].toLocal().toString().split(" ")[0]}";
    }).join('\n');

    _mostrarAlerta(mensaje);
  }

  void _seleccionarFecha() async {
    final seleccion = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (seleccion != null) {
      setState(() {
        _fechaSeleccionada = seleccion;
      });
    }
  }

  void _mostrarAlerta(String mensaje) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _idController.dispose();
    _especialidadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Citas"),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _verCitasGuardadas,
          ),
        ],
      ),
      drawer: const AppDrawner(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: const InputDecoration(labelText: "ID de la cita"),
            ),
            TextField(
              controller: _especialidadController,
              decoration: const InputDecoration(labelText: "Especialidad"),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _fechaSeleccionada == null
                        ? "Selecciona una fecha"
                        : _fechaSeleccionada!.toLocal().toString().split(" ")[0],
                  ),
                ),
                TextButton(
                  onPressed: _seleccionarFecha,
                  child: const Text("Elegir fecha"),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _guardarCita,
              child: const Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}
