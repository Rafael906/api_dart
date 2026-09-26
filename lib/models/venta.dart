
//  un modelo de venta.
class Venta {
final int idVenta;
final String fechaVenta;
final double totalVenta;
final String estado;

// Constructor de la base de datos
Venta({
required this.idVenta,
required this.fechaVenta,
required this.totalVenta,
required this.estado,
});

// Utilizamos para convertir el Map como un objeto Venta
factory Venta.fromMap(Map<String, dynamic> map) {
return Venta(
idVenta: map['id_venta'] as int,
fechaVenta: map['fecha_venta'] as String,
totalVenta: double.parse(map['total_venta'].toString()),
estado: map['estado'] as String,
);
}
// Convertimos el objeto Venta a Map para enviarlo como JSON
Map<String, dynamic> toMap() {
return {
'id_venta': idVenta,
'fecha_venta': fechaVenta,
'total_venta': totalVenta,
'estado': estado,
};
}
}
