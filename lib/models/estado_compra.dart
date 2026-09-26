// realizamos un modelo de estado de compra.
class EstadoCompra {
  final int id;
  final String nombre;
  final String? descripcion;
  final bool activo;

  // constructor de la base de datos
  EstadoCompra({
    required this.id,
    required this.nombre,
    this.descripcion,
    required this.activo,
  });

  // utilizamos para convertir el map como un json porque utiliza clave valor
  factory EstadoCompra.fromMap(Map<String, dynamic> map) {
    return EstadoCompra(
      id: map['id'] as int,
      nombre: map['nombre'] as String,
      descripcion: map['descripcion'] as String?,
      activo: map['activo'] == 1 || map['activo'] == true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'activo': activo,
    };
  }
}