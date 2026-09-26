import 'package:mysql_client/mysql_client.dart';

class VentaService {
  final MySQLConnection connection;

  VentaService(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, estado_venta_id, fecha, total '
          'FROM ventas ORDER BY id DESC',
    );
  }
}