import 'package:mysql_client/mysql_client.dart';

class ProductoSeeder {
  static Future<void> run(MySQLConnection connection) async {
    final productos = [
      {'nombre': 'Arroz', 'precio': 12.50},
      {'nombre': 'Azucar', 'precio': 8.50},
    ];

    for (final producto in productos) {
      final existente = await connection.execute(
        'SELECT id FROM productos WHERE nombre = :nombre LIMIT 1',
        {'nombre': producto['nombre']},
      );

      if (existente.rows.isEmpty) {
        await connection.execute(
          'INSERT INTO productos (nombre, precio) VALUES (:nombre, :precio)',
          producto,
        );
      }
    }

    print('Productos listos');
  }
}
