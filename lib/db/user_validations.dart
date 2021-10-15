import 'dart:async';
import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> getConnection() async {
  return await MySqlConnection.connect(ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'root',
      db: 'morgan',
      password: 'Mysql8024'));
}

Future<Results> verificaUsername(username) async {
  final sql = "SELECT username, senha from usuario where username = ?";
  return await getConnection().then((conn) => conn.query(sql, [username]));
}

Future<ResultRow> verificaSenha(username) async {
  var result = verificaUsername(username);
  if (result != null) return result.then((value) => value.last);
  return null;
}
