import 'package:mysql_client/mysql_client.dart';

class EstadoVentaSeeder {
  static Future<void> run(MySQLConnection connection) async {
    final estados = [
      {'nombre': 'Pendiente', 'descripcion': 'Venta pendiente'},
      {'nombre': 'Completada', 'descripcion': 'Venta completada'},
      {'nombre': 'Anulada', 'descripcion': 'Venta anulada'},
    ];

    for (final estado in estados) {
      final existente = await connection.execute(
        'SELECT id FROM estados_venta WHERE nombre = :nombre LIMIT 1',
        {'nombre': estado['nombre']},
      );

      if (existente.rows.isEmpty) {
        await connection.execute(
          'INSERT INTO estados_venta (nombre, descripcion, activo) '
              'VALUES (:nombre, :descripcion, 1)',
          estado,
        );
      }
    }

    print('Estados de venta listos');
  }
}