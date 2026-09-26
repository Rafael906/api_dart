import 'package:mysql_client/mysql_client.dart';

class DetalleVentaSeeder {
  static Future<void> run(MySQLConnection connection) async {
    final tablaDetalle = await connection.execute(
      "SHOW TABLES LIKE 'detalle_ventas'",
    );

    if (tablaDetalle.rows.isEmpty) {
      print('No existe la tabla detalle_ventas');
      return;
    }

    final existente = await connection.execute(
      'SELECT id FROM detalle_ventas LIMIT 1',
    );

    if (existente.rows.isNotEmpty) {
      print('Ya hay detalles de venta; se omite el ejemplo');
      return;
    }

    final ventas = await connection.execute(
      'SELECT id FROM ventas ORDER BY id LIMIT 1',
    );

    final productos = await connection.execute(
      'SELECT id FROM productos ORDER BY id LIMIT 1',
    );

    if (ventas.rows.isEmpty || productos.rows.isEmpty) {
      print('No se creó el detalle: faltan ventas o productos');
      return;
    }

    await connection.execute(
      'INSERT INTO detalle_ventas '
          '(venta_id, producto_id, precio_venta, cantidad, subtotal, estado) '
          'VALUES (:venta_id, :producto_id, :precio_venta, :cantidad, :subtotal, :estado)',
      {
        'venta_id': int.parse(ventas.rows.first.colAt(0)!),
        'producto_id': int.parse(productos.rows.first.colAt(0)!),
        'precio_venta': 12.50,
        'cantidad': 2,
        'subtotal': 25.00,
        'estado': 'Completada',
      },
    );

    print('Detalle de venta de ejemplo creado');
  }
}