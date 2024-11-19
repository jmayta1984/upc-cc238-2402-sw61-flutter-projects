import 'package:sqflite/sqlite_api.dart';
import 'package:superhero/features/heroes/domain/super_hero.dart';
import 'package:superhero/shared/app_database.dart';

class SuperHeroDao {
  Future<List<SuperHero>> fetchAll() async {
    final AppDatabase appDatabase = AppDatabase();
    final Database db = await appDatabase.openDb();
    List maps = await db.query(AppDatabase().heroTableName);
    return maps.map((map) => SuperHero.fromMap(map)).toList();
  }

  Future<void> insert(SuperHero hero) async {
    final AppDatabase appDatabase = AppDatabase();
    final Database db = await appDatabase.openDb();
    await db.insert(AppDatabase().heroTableName, hero.toMap());
  }

  Future<void> delete(String id) async {
    final AppDatabase appDatabase = AppDatabase();
    final Database db = await appDatabase.openDb();
    await db
        .delete(AppDatabase().heroTableName, where: ' id = ?', whereArgs: [id]);
  }

  Future<bool> isFavorite(String id) async {
    final AppDatabase appDatabase = AppDatabase();
    final Database db = await appDatabase.openDb();
    List maps = await db
        .query(AppDatabase().heroTableName, where: ' id = ?', whereArgs: [id]);
    return maps.isNotEmpty;
  }
}
