import 'package:mysql_client/mysql_client.dart';

class EstadoCompraSeeder {
  static Future<void> run(MySQLConnection connection) async {
    final estados = [
      {'nombre': 'Pendiente', 'descripcion': 'Compra pendiente de recepción'},
      {'nombre': 'Recibida', 'descripcion': 'Compra recibida'},
      {'nombre': 'Anulada', 'descripcion': 'Compra anulada'},
    ];

    for (final estado in estados) {
      final existente = await connection.execute(
        'SELECT id FROM estados_compra WHERE nombre = :nombre LIMIT 1',
        {'nombre': estado['nombre']},
      );

      if (existente.rows.isEmpty) {
        await connection.execute(
          'INSERT INTO estados_compra (nombre, descripcion, activo) '
          'VALUES (:nombre, :descripcion, 1)',
          estado,
        );
      }
    }

    print('Estados de compra listos');
  }
}
