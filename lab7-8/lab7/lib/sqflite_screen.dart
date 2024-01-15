import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQFLiteScreen extends StatefulWidget {
  @override
  _SQFLiteScreenState createState() => _SQFLiteScreenState();
}

class _SQFLiteScreenState extends State<SQFLiteScreen> {
  late Database _database;

  @override
  void initState() {
    super.initState();
    // Откройте базу данных или создайте ее, если она не существует
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'clothing_items.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // Создайте таблицу для хранения данных о предметах одежды
        return db.execute('''
          CREATE TABLE clothing_items(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            price REAL,
            is_available INTEGER
          )
        ''');
      },
    );
  }

  // Функция для добавления записи в базу данных.
  Future<void> _insertData() async {
    await _database.insert(
      'clothing_items',
      {'name': 'Sample Item', 'price': 19.99, 'is_available': 1},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Функция для чтения данных из базы данных.
  Future<void> _readData() async {
    final List<Map<String, dynamic>> items = await _database.query('clothing_items');
    // Обработайте и отобразите данные на экране.
    print(items);
  }

  // Функция для обновления данных в базе данных (по необходимости).
  Future<void> _updateData() async {
    await _database.update(
      'clothing_items',
      {'price': 99.99},
      where: 'name = ?',
      whereArgs: ['Sample Item'],
    );
  }

  // Функция для удаления данных из базы данных (по необходимости).
  Future<void> _deleteData() async {
    await _database.delete(
      'clothing_items',
      where: 'name = ?',
      whereArgs: ['Sample Item'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQFLite экран'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _insertData,
              child: Text('Добавить в SQFLite'),
            ),
            ElevatedButton(
              onPressed: _readData,
              child: Text('Чтение из SQFLite'),
            ),
            ElevatedButton(
              onPressed: _updateData,
              child: Text('Изменить данные'),
            ),
            ElevatedButton(
              onPressed: _deleteData,
              child: Text('Удалить данные'),
            ),
          ],
        ),
      ),
    );
  }
}
