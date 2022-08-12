import 'package:server_app/model/record_model.dart';
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
    final path = join(dbPath, 'fsmm.db');

    return openDatabase(path, version: 1,
        onCreate: (Database database, int version) async {
      await createTables(database);
    });
  }

  //create table
  static Future<void> createTables(Database database) async {
    try {
      await database.execute("CREATE TABLE server("
          " id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name TEXT,"
          " host TEXT,"
          "api TEXT,"
          "port TEXT,"
          "status tinyint(1),"
          "cammand TEXT,"
          "timevalue TEXT,"
          "description TEXT,"
          "commandruntime TEXT,"
          "createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)");
    } catch (e) {
      print(e);
    }
  }

//create server
  static Future<int> createServer(
      String name, String host, String api, String port) async {
    final db = await initDB();

    final data = {
      'name': name,
      'host': host,
      'api': api,
      'port': port,
      'status': 0,
      'cammand': "",
      'timevalue': "",
      'description': "",
      'commandruntime': "",
    };

    final id = await db.insert('server', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<ServerModel>> getServers() async {
    final db = await initDB();

    final result = await db.query('server', orderBy: "id");
    return result.map((e) => ServerModel.fromJson(e)).toList();
  }

//create records
  static Future<int> createRecords(String status, String cammand,
      String timevalue, String description, String commandruntime) async {
    final db = await initDB();

    final data = {
      'status': status,
      'cammand': cammand,
      'timevalue': timevalue,
      'description': description,
      'commandruntime': commandruntime
    };

    final id = await db.insert('records', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<RecordModel>> getRecords() async {
    final db = await initDB();

    final result = await db.query('server', orderBy: "id");
    return result.map((e) => RecordModel.fromJson(e)).toList();
  }

  static Future<void> deleteServer(int id) async {
    final db = await initDB();

    await db.delete('server', where: "id=?", whereArgs: [id]);
  }

//update records
  static Future<void> deleteRecords(int id) async {
    final db = await initDB();

    await db.delete('records', where: "id=?", whereArgs: [id]);
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

  //update records
  static Future<int> updateRecords(int id, int status, String cammand,
      String timevalue, String description, String commandruntime) async {
    final db = await initDB();

    final data = {
      'status': status,
      'cammand': cammand,
      'timevalue': timevalue,
      'description': description,
      'commandruntime': commandruntime,
      'createdAt': DateTime.now().toString()
    };
    final resultid =
        await db.update('server', data, where: "id=?", whereArgs: [id]);
    return resultid;
  }
}
