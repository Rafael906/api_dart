import 'package:mysql_client/mysql_client.dart';

class DetalleCompraService {
  final MySQLConnection connection;

  DetalleCompraService(this.connection);

  // realizamos el metodo de obtener todos los detalles de compra
  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      // obtenemos los datos de la base de datos
      'SELECT id, compra_id, producto_id, cantidad, '
          'precio_unitario, subtotal '
          'FROM detalle_compra '
          'ORDER BY id DESC',
    );
  }
}