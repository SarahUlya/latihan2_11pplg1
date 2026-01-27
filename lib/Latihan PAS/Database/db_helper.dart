import 'package:latihan2_11pplg1/Latihan%20PAS/Models/cat.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  factory DbHelper() => _instance;
  DbHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, "cats.db");

  // Jangan hapus database setiap init
  // await deleteDatabase(path);

  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE favorites(
          id TEXT PRIMARY KEY,
          name TEXT,
          origin TEXT,
          temperament TEXT,
          image TEXT,
          username TEXT
        )
      ''');
    },
  );
}


  Future<int> insertFavorite(Cat cat, String username) async {
    final dbClient = await db;
    return await dbClient.insert(
      'favorites',
      {
        'id': cat.id,
        'name': cat.name,
        'origin': cat.origin,
        'temperament': cat.temperament,
        'image': cat.displayImage,
        'username': username,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteFavorite(String id, String username) async {
    final dbClient = await db;
    return await dbClient.delete(
      'favorites',
      where: 'id = ? AND username = ?',
      whereArgs: [id, username],
    );
  }

  Future<List<Cat>> getFavoritesByUser(String username) async {
  final dbClient = await db;
  final res = await dbClient.query(
    'favorites',
    where: 'username = ?',
    whereArgs: [username],
  );

  return res.map((e) => Cat.fromDb(e, username)).toList();
}


  Future<bool> isFavorite(String id, String username) async {
    final dbClient = await db;
    final res = await dbClient.query(
      'favorites',
      where: 'id = ? AND username = ?',
      whereArgs: [id, username],
    );
    return res.isNotEmpty;
  }
}
