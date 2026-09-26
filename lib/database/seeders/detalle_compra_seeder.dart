import 'package:mysql_client/mysql_client.dart';

class DetalleCompraSeeder {
  static Future<void> run(MySQLConnection connection) async {
    final existente = await connection.execute(
      'SELECT id FROM detalle_compra LIMIT 1',
    );
    if (existente.rows.isNotEmpty) {
      print('Ya hay detalles de compra; se omite el detalle de ejemplo');
      return;
    }

    final compras = await connection.execute(
      'SELECT id FROM compras ORDER BY id LIMIT 1',
    );
    final productos = await connection.execute(
      'SELECT id FROM productos ORDER BY id LIMIT 1',
    );

    if (compras.rows.isEmpty || productos.rows.isEmpty) {
      print('No se creó el detalle: faltan compras o productos');
      return;
    }

    await connection.execute(
      'INSERT INTO detalle_compra '
      '(compra_id, producto_id, cantidad, precio_unitario, subtotal) '
      'VALUES (:compra_id, :producto_id, :cantidad, :precio_unitario, :subtotal)',
      {
        'compra_id': int.parse(compras.rows.first.colAt(0)!),
        'producto_id': int.parse(productos.rows.first.colAt(0)!),
        'cantidad': 2.00,
        'precio_unitario': 12.50,
        'subtotal': 25.00,
      },
    );

    print('Detalle de compra de ejemplo creado');
  }
}
