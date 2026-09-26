// realizamos un modelo de compra.
class Compra {
  final int id;
  final int proveedorId;
  final int estadoCompraId;
  final DateTime fecha;
  final double total;

  // constructor de la base de datos
  Compra({
    required this.id,
    required this.proveedorId,
    required this.estadoCompraId,
    required this.fecha,
    required this.total,
  });

  // utilizamos para convertir el map como un json porque utiliza clave valor
  factory Compra.fromMap(Map<String, dynamic> map) {
    return Compra(
      id: map['id'] as int,
      proveedorId: map['proveedor_id'] as int,
      estadoCompraId: map['estado_compra_id'] as int,
      fecha: DateTime.parse(map['fecha'].toString()),
      total: double.parse(map['total'].toString()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'proveedor_id': proveedorId,
      'estado_compra_id': estadoCompraId,
      'fecha': fecha.toIso8601String(),
      'total': total,
    };
  }
}