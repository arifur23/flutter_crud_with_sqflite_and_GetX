import 'package:flutter_crud_sqflite/Db/database.dart';
import 'package:flutter_crud_sqflite/Models/customer.dart';

class CustomerOperation{

  Future<Customer> creates(Customer customer) async{
    final db = await DatabaseConfig.instance.database;

    final id = await db!.insert(tableCustomer, customer.toJson());

    return customer.copy(id: id);
  }

  Future<Customer> readOnly(int id) async{
    final db = await DatabaseConfig.instance.database;

    final newCustomer = await db!.query(tableCustomer,where: '$CustomerFields.id = ?',whereArgs: [id]);
    return Customer.fromJson(newCustomer.first);
  }

  Future<List<Customer>> readAll() async{

    final db = await DatabaseConfig.instance.database;
    final customers = await db!.query(tableCustomer);
    return customers.map((json) => (Customer.fromJson(json))).toList();
  }

  Future<int> update(Customer customer) async{

    final db = await DatabaseConfig.instance.database;
    return db!.update(tableCustomer, customer.toJson(),where: '$CustomerFields.id = ?',whereArgs: [customer.id]);
  }

  Future<int> delete(int id) async{
    final db = await DatabaseConfig.instance.database;
    return await db!.delete(tableCustomer,where: '$CustomerFields.id = ?',whereArgs: [id]);
  }

}