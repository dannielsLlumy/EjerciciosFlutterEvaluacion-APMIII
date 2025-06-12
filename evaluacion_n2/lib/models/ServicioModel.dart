class Servicio {
  final String nombre;
  final String horario;
  final String descripcion;
  final String imagen;

  Servicio({
    required this.nombre,
    required this.horario,
    required this.descripcion,
    required this.imagen,
  });

  factory Servicio.fromJson(Map<String, dynamic> json) {
    return Servicio(
      nombre: json['nombre'],
      horario: json['horario'],
      descripcion: json['descripcion'],
      imagen: json['imagen'],
    );
  }
}
