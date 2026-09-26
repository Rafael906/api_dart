import 'package:mysql_client/mysql_client.dart';

class VentaSeeder {
  static Future<void> run(MySQLConnection connection) async {
    final existente = await connection.execute(
      'SELECT id FROM ventas LIMIT 1',
    );

    if (existente.rows.isNotEmpty) {
      print('Ya hay ventas; se omite la venta de ejemplo');
      return;
    }

    final tablaEstados = await connection.execute(
      "SHOW TABLES LIKE 'estados_venta'",
    );

    if (tablaEstados.rows.isEmpty) {
      print('No se creó la venta: no existe la tabla estados_venta');
      return;
    }

    final estados = await connection.execute(
      'SELECT id FROM estados_venta ORDER BY id LIMIT 1',
    );

    if (estados.rows.isEmpty) {
      print('No se creó la venta: estados_venta no tiene registros');
      return;
    }

    await connection.execute(
      'INSERT INTO ventas (estado_venta_id, total) '
          'VALUES (:estado_venta_id, :total)',
      {
        'estado_venta_id': int.parse(estados.rows.first.colAt(0)!),
        'total': 25.00,
      },
    );

    print('Venta de ejemplo creada');
  }
}