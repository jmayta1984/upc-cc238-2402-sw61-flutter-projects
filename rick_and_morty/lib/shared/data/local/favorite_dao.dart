import 'package:rick_and_morty/shared/data/local/app_database.dart';
import 'package:rick_and_morty/shared/data/local/favorite_model.dart';

class FavoriteDao {
  Future<void> insertFavorite(FavoriteModel favorite) async {
    final db = await AppDatabase().openDb();
    await db.insert(AppDatabase().tableName, favorite.toMap());
  }

  Future<void> deleteFavorite(int id) async {
    final db = await AppDatabase().openDb();
    await db.delete(
      AppDatabase().tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<FavoriteModel>> getFavorites() async {
    final db = await AppDatabase().openDb();
    final List maps = await db.query(AppDatabase().tableName);
    return maps.map((e) => FavoriteModel.fromMap(e)).toList();
  }

  Future<bool> isFavorite(int id) async {
    final db = await AppDatabase().openDb();
    final List maps = await db.query(
      AppDatabase().tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return maps.isNotEmpty;
  }
}
