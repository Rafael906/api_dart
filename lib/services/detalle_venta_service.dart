
// Aqui tenemos la conexion o los metodos para realizar el sistema
import 'package:mysql_client/mysql_client.dart';

class DetalleVentaService {
final MySQLConnection connection;

DetalleVentaService(this.connection);

// Realizamos el metodo de obtener que es como un index
Future<IResultSet> obtenerTodos() async {
return await connection.execute(
// Realizamos una consulta sencilla donde se obtiene
// los datos de la base de datos
'SELECT id, venta_id, producto_id, precio_venta, '
'cantidad, subtotal, estado '
'FROM detalle_ventas ORDER BY id DESC',
);
}
}
