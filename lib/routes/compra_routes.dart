import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';
import '../services/compra_service.dart';

Router compraRoutes(MySQLConnection connection) {
  final router = Router();

  final service = CompraService(connection);

  router.get('/api/compras', (Request request) async {
    final resultado = await service.obtenerTodos();

    final compras = resultado.rows.map((row) {
      return {
        'id': row.colAt(0),
        'proveedor_id': row.colAt(1),
        'estado_compra_id': row.colAt(2),
        'fecha': row.colAt(3),
        'total': row.colAt(4),
      };
    }).toList();

    return Response.ok(
      jsonEncode(compras),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

  return router;
}