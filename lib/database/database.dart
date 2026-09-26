import 'package:mysql_client/mysql_client.dart';

//realizamos la conexion a la base de datos
class Database {
  static Future<MySQLConnection>connect() async{
    final connection= await MySQLConnection.createConnection(
      //host para trabajar en local tambien pude utlizarse el  localhost
        host: '127.0.0.1',
        //puerto de la base de datos
        port: 3306,
        //nombre de ussuario que es recomendable sea otro
        userName: 'root',
        password: '',
        databaseName: 'apidart'
    );

    await connection.connect();
    return connection;
  }
}