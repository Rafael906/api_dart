import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';
import '../services/detalle_venta_service.dart';

Router detalleVentaRoutes(MySQLConnection connection) {
final router = Router();

final service = DetalleVentaService(connection);

router.get('/api/detalle-ventas', (Request request) async {
final resultado = await service.obtenerTodos();

final detalles = resultado.rows.map((row) {
return {
'id': row.colAt(0),
'venta_id': row.colAt(1),
'producto_id': row.colAt(2),
'precio_venta': row.colAt(3),
'cantidad': row.colAt(4),
'subtotal': row.colAt(5),
'estado': row.colAt(6),
};
}).toList();

return Response.ok(
jsonEncode(detalles),
headers: {
'Content-Type': 'application/json',
},
);
});

return router;
}
