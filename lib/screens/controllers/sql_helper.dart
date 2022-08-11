import 'package:server_app/model/server_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlHelper {
  //create and initialize db
  static Future<Database> initDB() async {
//storing the db in the device
//on android,data/data
//on iso,documents
    final dbPath = await getDatabasesPath();
    //best prcatice
    final path = join(dbPath, 'fsm.db');

    return openDatabase(path, version: 1,
        onCreate: (Database database, int version) async {
      await createTables(database);
    });
  }

  //create table
  static Future<void> createTables(Database database) async {
    try {
      await database.execute("""CREATE TABLE server(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            host TEXT,
            api TEXT,
            port TEXT,
            createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
    } catch (e) {
      print(e);
    }
  }

  static Future<int> createServer(
      String name, String host, String api, String port) async {
    final db = await initDB();

    final data = {'name': name, 'host': host, 'api': api, 'port': port};

    final id = await db.insert('server', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<ServerModel>> getServers() async {
    final db = await initDB();

    final result = await db.query('server', orderBy: "id");
    return result.map((e) => ServerModel.fromJson(e)).toList();
  }

  static Future<void> deleteServer(int id) async {
    final db = await initDB();

    await db.delete('server', where: "id=?", whereArgs: [id]);
  }

  static Future<int> updateServer(
      int id, String name, String host, String api, String port) async {
    final db = await initDB();

    final data = {
      'name': name,
      'host': host,
      'api': api,
      'port': port,
      'createdAt': DateTime.now().toString()
    };
    final resultid =
        await db.update('server', data, where: "id=?", whereArgs: [id]);
    return resultid;
  }
}
