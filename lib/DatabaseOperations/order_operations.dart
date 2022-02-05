import 'package:flutter_crud_sqflite/Db/database.dart';
import 'package:flutter_crud_sqflite/Models/order.dart';

class OrderOperations{

  Future<Order> create(Order order) async{

    final db = await DatabaseConfig.instance.database;
    final id = await db!.insert(tableOrder, order.toJson());

    return order.copy(id: id);
  }

  Future<Order> readOnly(int id) async{
    final db = await DatabaseConfig.instance.database;

    final newOrder = await db!.query(tableOrder,columns: OrderFields.values,where: '${OrderFields.id} = ?',whereArgs: [id]);
    if(newOrder.isNotEmpty){
      return Order.fromJson(newOrder.first);
    }
    else{
      throw Exception('ID $id not found');
    }
  }

  Future<List<Order>> readAll() async{
    final db = await DatabaseConfig.instance.database;
    const orderBy = '${OrderFields.orderTime} ACS';
    final orders = await db!.query(tableOrder,orderBy: orderBy);

    return orders.map((json) => Order.fromJson(json)).toList();
  }

  Future<int> update(Order order) async {
    final db = await DatabaseConfig.instance.database;
    return db!.update(
      tableOrder,
      order.toJson(),
      where: '${OrderFields.id} = ?',
      whereArgs: [order.id],
    );
  }

  Future<int> delete(int id) async{
    final db = await DatabaseConfig.instance.database;
    return db!.delete(tableOrder, where: '$OrderFields.id = ?', whereArgs: [id]);
  }
}