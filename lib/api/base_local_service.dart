import 'package:path/path.dart';
import 'package:projeto_ford/api/common/dtos/baseDTO.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseLocalService {
  late Database con;

  openDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'ford_app.db');

    con = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE IF NOT EXISTS User (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, password TEXT)',
        );
      },
    );
  }

  Future<bool> insert(BaseDTO dto);
  Future<List<BaseDTO>> listAll();
  Future<bool> update(BaseDTO dto);
  Future<bool> delete(int id);
}
