import 'package:mysql_client/mysql_client.dart';

class EstadoCompraService {
  final MySQLConnection connection;

  EstadoCompraService(this.connection);

  // realizamos el metodo de obtener todos los estados de compra
  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      // obtenemos los datos de la base de datos
      'SELECT id, nombre, descripcion, activo '
          'FROM estados_compra '
          'ORDER BY id DESC',
    );
  }
}