import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';
import '../services/estado_compra_service.dart';

Router estadoCompraRoutes(MySQLConnection connection) {
  final router = Router();

  final service = EstadoCompraService(connection);

  router.get('/api/estados-compra', (Request request) async {
    final resultado = await service.obtenerTodos();

    final estados = resultado.rows.map((row) {
      return {
        'id': row.colAt(0),
        'nombre': row.colAt(1),
        'descripcion': row.colAt(2),
        'activo': row.colAt(3),
      };
    }).toList();

    return Response.ok(
      jsonEncode(estados),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

  return router;
}