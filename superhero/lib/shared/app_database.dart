import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  final int version = 1;
  final String databaseName = 'superhero.db';
  final String heroTableName = 'heroes';
  Database? db;

  Future<Database> openDb() async {
    db ??= await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: version,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE $heroTableName (id text primary key, name text, intelligence text, image text, gender text )";
        db.execute(query);
      },
    );
    return db as Database;
  }
}
