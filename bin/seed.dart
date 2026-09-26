import 'package:api_dart/database/database.dart';
import 'package:api_dart/database/seeders/compra_seeder.dart';
import 'package:api_dart/database/seeders/detalle_compra_seeder.dart';
import 'package:api_dart/database/seeders/detalle_venta_seeder.dart';
import 'package:api_dart/database/seeders/estado_compra_seeder.dart';
import 'package:api_dart/database/seeders/producto_seeder.dart';
import 'package:api_dart/database/seeders/proveedores_seeder.dart';
import 'package:api_dart/database/seeders/venta_seeder.dart';
import 'package:api_dart/database/seeders/estado_venta_seeder.dart';

Future<void> main() async {
  print('Iniciando seeders...');

  final connection = await Database.connect();

  try {
    await ProductoSeeder.run(connection);
    await ProveedorSeeder.run(connection);
    await EstadoCompraSeeder.run(connection);
    await CompraSeeder.run(connection);
    await DetalleCompraSeeder.run(connection);
    await EstadoVentaSeeder.run(connection);
    await VentaSeeder.run(connection);
    await DetalleVentaSeeder.run(connection);

    print('Seeders ejecutados correctamente');
  } catch (e) {
    print('Error ejecutando los seeders: $e');
  } finally {
    await connection.close();
  }
}
