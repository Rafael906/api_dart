import 'package:mysql_client/mysql_client.dart';

class CompraService {
  final MySQLConnection connection;

  CompraService(this.connection);

  // realizamos el metodo de obtener todas las compras
  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      // obtenemos los datos de la base de datos
      'SELECT id, proveedor_id, estado_compra_id, fecha, total '
          'FROM compras '
          'ORDER BY id DESC',
    );
  }
}