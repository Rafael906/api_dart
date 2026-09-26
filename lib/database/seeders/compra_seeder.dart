import 'package:mysql_client/mysql_client.dart';

class CompraSeeder {
  static Future<void> run(MySQLConnection connection) async {
    final existente = await connection.execute(
      'SELECT id FROM compras LIMIT 1',
    );
    if (existente.rows.isNotEmpty) {
      print('Ya hay compras; se omite la compra de ejemplo');
      return;
    }

    final proveedores = await connection.execute(
      'SELECT id FROM proveedores ORDER BY id LIMIT 1',
    );
    final estados = await connection.execute(
      'SELECT id FROM estados_compra WHERE nombre = :nombre LIMIT 1',
      {'nombre': 'Recibida'},
    );

    if (proveedores.rows.isEmpty || estados.rows.isEmpty) {
      print('No se creó la compra: faltan proveedores o estados de compra');
      return;
    }

    await connection.execute(
      'INSERT INTO compras (proveedor_id, estado_compra_id, total) '
      'VALUES (:proveedor_id, :estado_compra_id, :total)',
      {
        'proveedor_id': int.parse(proveedores.rows.first.colAt(0)!),
        'estado_compra_id': int.parse(estados.rows.first.colAt(0)!),
        'total': 25.00,
      },
    );

    print('Compra de ejemplo creada');
  }
}
