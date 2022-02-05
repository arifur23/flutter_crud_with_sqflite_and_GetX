import 'package:flutter_crud_sqflite/Models/customer.dart';
import 'package:flutter_crud_sqflite/Models/order.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseConfig{
  static final DatabaseConfig instance = DatabaseConfig._init();
  static Database? _database;
  DatabaseConfig._init();

  Future<Database?> get database async {
    if(_database != null) return _database!;

    _database = await _initDB('simpledatabase.db');
    return _database!;
  }

  Future<Database> _initDB(String dbname) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,dbname);

    return await openDatabase(path, version: 1, onCreate: _createDataBaseTable);
  }

  Future _createDataBaseTable(Database db, int version) async{
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INT NOT NULL';
    const doubleType = 'DOUBLE NOT NULL';

    await db.execute('''
    CREATE TABLE $tableCustomer (
    $CustomerFields.id $idType,
    $CustomerFields.name $textType,
    $CustomerFields.email $textType,
    $CustomerFields.age $integerType,
    $CustomerFields.premium $boolType,
    $CustomerFields.createdAt $textType
    )
    ''');

    await db.execute('''
    CREATE TABLE $tableOrder(
    $OrderFields.id $idType,
    $OrderFields.name $textType,
    $OrderFields.completed $boolType,
    $OrderFields.orderTime $textType
    $tableCustomer $integerType,
    FOREIGN KEY ($tableCustomer) REFERENCES customer($CustomerFields.id)
    )
    ''');
  }

}