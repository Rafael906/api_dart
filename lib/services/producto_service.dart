// aqui tenemos la conexion o lo metodos para realizar el sistema
import 'package:mysql_client/mysql_client.dart';

class ProductoService {
  final MySQLConnection connection;
  ProductoService(this.connection);
//iresultset es el tipo de resultado que va a dar datos.
  //realizamos el metodo de obtener que es como un index
  Future<IResultSet> obtenerTodos() async{
    return await connection.execute(

      //realizamos una consulta sencilla donde se obtiene los datos de la base
      // de datos
      'SELECT id, nombre, precio FROM productos ORDER BY id DESC',
    );
  }
}