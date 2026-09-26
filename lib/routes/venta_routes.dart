import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';
import '../services/venta_service.dart';

Router ventaRoutes(MySQLConnection connection) {
  final router = Router();
  final service = VentaService(connection);

  router.get('/api/ventas', (Request request) async {
    final resultado = await service.obtenerTodos();

    final ventas = resultado.rows.map((row) {
      return {
        'id': row.colAt(0),
        'estado_venta_id': row.colAt(1),
        'fecha': row.colAt(2),
        'total': row.colAt(3),
      };
    }).toList();

    return Response.ok(
      jsonEncode(ventas),
      headers: {'Content-Type': 'application/json'},
    );
  });

  return router;
}