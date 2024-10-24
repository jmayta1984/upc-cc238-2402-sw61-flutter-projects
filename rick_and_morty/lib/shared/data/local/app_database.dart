import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  final int version = 1;
  final String databaseName = 'characters.db';
  final String tableName = 'characters';

  Database? db;

  Future<Database> openDb() async {
    db ??= await openDatabase(join(await getDatabasesPath(), databaseName), version: 1,
    onCreate: (db, version) {
      String query = 'create table characters (id integer primary key, name text, species text, status text, image text)';
      db.execute(query);
    },);
    return db as Database;
  } 
  
}