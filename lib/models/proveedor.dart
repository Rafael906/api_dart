// realizamos un modelo de proveedor.
class Proveedor {
  final int id;
  final String nombre;
  final String? telefono;
  final String? email;
  final String? direccion;
  final bool activo;

  // constructor de la base de datos
  Proveedor({
    required this.id,
    required this.nombre,
    this.telefono,
    this.email,
    this.direccion,
    required this.activo,
  });

  // utilizamos para convertir el map como un json porque utiliza clave valor
  factory Proveedor.fromMap(Map<String, dynamic> map) {
    return Proveedor(
      id: map['id'] as int,
      nombre: map['nombre'] as String,
      telefono: map['telefono'] as String?,
      email: map['email'] as String?,
      direccion: map['direccion'] as String?,
      activo: map['activo'] == 1 || map['activo'] == true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'telefono': telefono,
      'email': email,
      'direccion': direccion,
      'activo': activo,
    };
  }
}