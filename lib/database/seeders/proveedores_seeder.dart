import 'package:mysql_client/mysql_client.dart';

class ProveedorSeeder {
  static Future<void> run(MySQLConnection connection) async {
    final proveedores = [
      {
        'nombre': 'Distribuidora Santa Cruz',
        'telefono': '70012345',
        'email': 'ventas@santacruz.com',
        'direccion': 'Santa Cruz de la Sierra',
        'activo': 1,
      },
      {
        'nombre': 'Comercial La Paz',
        'telefono': '71234567',
        'email': 'contacto@comerciallpa.com',
        'direccion': 'La Paz',
        'activo': 1,
      },
    ];

    for (final proveedor in proveedores) {
      final existente = await connection.execute(
        'SELECT id FROM proveedores WHERE email = :email LIMIT 1',
        {'email': proveedor['email']},
      );

      if (existente.rows.isEmpty) {
        await connection.execute(
          'INSERT INTO proveedores '
          '(nombre, telefono, email, direccion, activo) '
          'VALUES (:nombre, :telefono, :email, :direccion, :activo)',
          proveedor,
        );
      }
    }

    print('Proveedores listos');
  }
}
