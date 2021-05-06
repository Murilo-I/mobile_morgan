import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String _scriptdb =
    "CREATE TABLE conversas(texto Text, remetente Text CHECK(remetente = 'morgan' OR remetente = 'user'))";

Future<Database> historicodb() async {
  // Evita erros em caso do flutter atualizar
  WidgetsFlutterBinding.ensureInitialized();

  final Future<Database> database =
      openDatabase(join(await getDatabasesPath(), 'historico_conversa.db'),
          onCreate: (db, version) {
    return db.execute(_scriptdb);
  }, version: 1);

  return database;
}

Future<void> salvarConversa(Conversa conversa) async {
  final Database db = await historicodb();
  await db.insert('conversas', conversa.toMap());
}

Future<List<Conversa>> trazerHistorico() async {
  final Database db = await historicodb();

  final List<Map<String, dynamic>> maps = await db.query('conversas');

  return List.generate(maps.length,
      (index) => Conversa(maps[index]['texto'], maps[index]['remetente']));
}

Future<void> apagarHistorico() async {
  final Database db = await historicodb();
  db.execute('DELETE FROM conversas');
}

class Conversa {
  final String texto;
  final String remetente;

  Conversa(this.texto, this.remetente);

  Map<String, dynamic> toMap() {
    return {'texto': texto, 'remetente': remetente};
  }

  @override
  String toString() {
    return "$remetente: $texto";
  }
}
