
//modelo de detalle de venta.
class DetalleVenta {
final int id;
final int ventaId;
final int productoId;
final double precioVenta;
final int cantidad;
final double subtotal;
final String estado;

// Constructor de la base de datos
DetalleVenta({
required this.id,
required this.ventaId,
required this.productoId,
required this.precioVenta,
required this.cantidad,
required this.subtotal,
required this.estado,
});

// Utilizamos para convertir el Map como un objeto DetalleVenta
factory DetalleVenta.fromMap(Map<String, dynamic> map) {
return DetalleVenta(
id: map['id'] as int,
ventaId: map['venta_id'] as int,
productoId: map['producto_id'] as int,
precioVenta: double.parse(map['precio_venta'].toString()),
cantidad: map['cantidad'] as int,
subtotal: double.parse(map['subtotal'].toString()),
estado: map['estado'] as String,
);
}

// Convertimos el objeto DetalleVenta a Map para enviarlo como JSON
Map<String, dynamic> toMap() {
return {
'id': id,
'venta_id': ventaId,
'producto_id': productoId,
'precio_venta': precioVenta,
'cantidad': cantidad,
'subtotal': subtotal,
'estado': estado,
};
}
}
