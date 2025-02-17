import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:white_label_business_app/models/worker.dart';

// Database Helper Class
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize database
  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'app_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Create table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL
      )
    ''');
  }

  // **CRUD Operations**

  // **1. Insert a Worker**
  Future<int> insertUser(Worker worker) async {
    final db = await database;
    return await db.insert('users', worker.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // **2. Get all Users**
  Future<List<Worker>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> users = await db.query('users');
    return users.map((worker) => Worker.fromMap(worker)).toList();
  }

  // **3. Get a Single Worker by ID**
  Future<Worker?> getUserById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> users = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (users.isNotEmpty) {
      return Worker.fromMap(users.first);
    }
    return null;
  }

  // **4. Update a Worker**
  Future<int> updateUser(Worker worker) async {
    final db = await database;
    return await db.update(
      'users',
      worker.toMap(),
      where: 'id = ?',
      whereArgs: [worker.id],
    );
  }

  // **5. Delete a Worker**
  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // **6. Delete All Users**
  Future<int> deleteAllUsers() async {
    final db = await database;
    return await db.delete('users');
  }
}
