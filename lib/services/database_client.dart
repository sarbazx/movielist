import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../movies/models/movie.dart';

class DatabaseClient {
  static final DatabaseClient instance = DatabaseClient._();
  static Database? _database;

  DatabaseClient._();

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'movies.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    try {
      await db.execute('''
      CREATE TABLE movies(
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        year TEXT NOT NULL,
        type TEXT NOT NULL,
        poster TEXT NOT NULL
      )
    ''');
    } catch (e) {
      // TODO: Handle this error
    }
  }

  Future<void> insertMovies(List<Movie> movies) async {
    try {
      final db = await database;
      final batch = db.batch();

      for (final movie in movies) {
        batch.insert(
          'movies',
          movie.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      await batch.commit();
    } catch (e) {
      // TODO: Handle this error
    }
  }

  Future<List<Movie>> getMovies() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('movies');

      return List.generate(
        maps.length,
        (index) => Movie.fromJson(maps[index]),
      );
    } catch (e) {
      // TODO: Handle this error
      return [];
    }
  }

  Future<void> deleteMovies() async {
    final db = await database;
    await db.delete('movies');
  }
}
