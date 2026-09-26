import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:api_dart/database/database.dart';
import 'package:api_dart/routes/compra_routes.dart';
import 'package:api_dart/routes/detalle_compra_routes.dart';
import 'package:api_dart/routes/detalle_venta_routes.dart';
import 'package:api_dart/routes/estado_compra_routes.dart';
import 'package:api_dart/routes/producto_routes.dart';
import 'package:api_dart/routes/proveedor_routes.dart';
import 'package:api_dart/routes/venta_routes.dart';

Future<void> main(List<String> args) async {
  final connection = await Database.connect();

  print('Conectado a MySQL.');

  final router = Router();

  router.get('/prueba', (Request request) {
    return Response.ok('La ruta funciona');
  });

  // Ruta principal
  router.get('/', (Request request) {
    return Response.ok(
      'API Dart funcionando correctamente\n',
    );
  });

  // Redoc
  router.get('/docs', (Request request) async {
    final file = File('web/redoc.html');

    if (!await file.exists()) {
      return Response.notFound(
        'redoc.html no encontrado',
      );
    }

    return Response.ok(
      await file.readAsString(),
      headers: {
        'Content-Type': 'text/html; charset=utf-8',
      },
    );
  });

  // Documentación OpenAPI
  router.get('/openapi.yaml', (Request request) async {
    final file = File('web/openapi.yaml');

    if (!await file.exists()) {
      return Response.notFound(
        'openapi.yaml no encontrado',
      );
    }

    return Response.ok(
      await file.readAsString(),
      headers: {
        'Content-Type': 'text/yaml; charset=utf-8',
      },
    );
  });

  // Routers de cada módulo
  final productoRouter = productoRoutes(connection);
  final proveedorRouter = proveedorRoutes(connection);
  final estadoCompraRouter = estadoCompraRoutes(connection);
  final compraRouter = compraRoutes(connection);
  final detalleCompraRouter = detalleCompraRoutes(connection);
  final ventaRouter = ventaRoutes(connection);
  final detalleVentaRouter = detalleVentaRoutes(connection);

  // Combina las rutas principales y las rutas de los módulos
  final rutas = Cascade()
      .add(router.call)
      .add(productoRouter.call)
      .add(proveedorRouter.call)
      .add(estadoCompraRouter.call)
      .add(compraRouter.call)
      .add(detalleCompraRouter.call)
      .add(ventaRouter.call)
      .add(detalleVentaRouter.call)
      .handler;

  // Servidor
  final ip = InternetAddress.anyIPv4;

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(rutas);

  final port = int.parse(
    Platform.environment['PORT'] ?? '8080',
  );

  final server = await serve(
    handler,
    ip,
    port,
  );

  print(
    'Servidor ejecutándose en '
        'http://${server.address.host}:${server.port}',
  );
}
