import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';
import '../services/proveedor_service.dart';

Router proveedorRoutes(MySQLConnection connection) {
  final router = Router();

  final service = ProveedorService(connection);

  router.get('/api/proveedores', (Request request) async {
    final resultado = await service.obtenerTodos();

    final proveedores = resultado.rows.map((row) {
      return {
        'id': row.colAt(0),
        'nombre': row.colAt(1),
        'telefono': row.colAt(2),
        'email': row.colAt(3),
        'direccion': row.colAt(4),
        'activo': row.colAt(5),
      };
    }).toList();

    return Response.ok(
      jsonEncode(proveedores),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

  return router;
}