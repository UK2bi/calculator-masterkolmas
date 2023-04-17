import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


import '../model/calculation-history.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'history.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE history(id INTEGER PRIMARY KEY AUTOINCREMENT, calculation TEXT, title TEXT, time TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<int> insert(CalculationHistory history) async {
    final db = await DBHelper.database();
    return db.insert(
      'history',
      history.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<CalculationHistory>> getHistory() async {
    final db = await DBHelper.database();
    final List<Map<String, dynamic>> maps = await db.query('history');
    return List.generate(maps.length, (i) {
      return CalculationHistory.fromMap(maps[i]);
    });
  }

  static Future<List<CalculationHistory>> getAllCalculations() async {
    final db = await DBHelper.database();
    final List<Map<String, dynamic>> maps = await db.query('history');
    return List.generate(maps.length, (i) {
      return CalculationHistory(
        id: maps[i]['id'].toString(),
        calculation: maps[i]['calculation'],
        title: maps[i]['title'],
        time: maps[i]['time'],
      );
    });
  }
}