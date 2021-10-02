import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final databasePath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(databasePath, 'user.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user(id TEXT PRIMARY KEY, nome TEXT, profile_photo TEXT)');
      },
      version: 1,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }
}
