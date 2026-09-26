// realizamos un modelo del detalle de compra.
class DetalleCompra {
  final int id;
  final int compraId;
  final int productoId;
  final double cantidad;
  final double precioUnitario;
  final double subtotal;

  // constructor de la base de datos
  DetalleCompra({
    required this.id,
    required this.compraId,
    required this.productoId,
    required this.cantidad,
    required this.precioUnitario,
    required this.subtotal,
  });

  // utilizamos para convertir el map como un json porque utiliza clave valor
  factory DetalleCompra.fromMap(Map<String, dynamic> map) {
    return DetalleCompra(
      id: map['id'] as int,
      compraId: map['compra_id'] as int,
      productoId: map['producto_id'] as int,
      cantidad: double.parse(map['cantidad'].toString()),
      precioUnitario: double.parse(map['precio_unitario'].toString()),
      subtotal: double.parse(map['subtotal'].toString()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'compra_id': compraId,
      'producto_id': productoId,
      'cantidad': cantidad,
      'precio_unitario': precioUnitario,
      'subtotal': subtotal,
    };
  }
}