import 'package:mysql_client/mysql_client.dart';

class ProveedorService {
  final MySQLConnection connection;

  ProveedorService(this.connection);

  // realizamos el metodo de obtener todos los proveedores
  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      // obtenemos los datos de la base de datos
      'SELECT id, nombre, telefono, email, direccion, activo '
          'FROM proveedores '
          'ORDER BY id DESC',
    );
  }
}