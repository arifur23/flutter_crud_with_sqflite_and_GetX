const tableOrder = 'order';
class OrderFields{

  static final List<String> values = [ id, name, orderTime, completed,customer];

  static const String id = '_id';
  static const String name = 'name';
  static const String orderTime = 'orderTime';
  static const String completed = 'completed';
  static const String customer = 'customer';
}

class Order{
  final int? id;
  final String name;
  final DateTime orderTime;
  final bool completed;
  final int customer;

  const Order({
    required this.id,
    required this.name,
    required this.orderTime,
    required this.completed,
    required this.customer
});

  Order copy({
    int? id,
    String? name,
    DateTime? orderTime,
    bool? completed,
    int? customer
}) => Order(
      id: id ?? this.id,
      name: name ?? this.name,
      orderTime: orderTime ?? this.orderTime,
      completed: completed ?? this.completed,
      customer: customer ?? this.customer
  );

  static Order fromJson(Map<String, Object?> json) => Order(
    id: json[OrderFields.id] as int,
    name: json[OrderFields.name] as String,
    orderTime: DateTime.parse(json[OrderFields.orderTime] as String),
    completed: json[OrderFields.completed] as bool,
    customer: json[OrderFields.customer] as int
  );

  Map<String, Object?> toJson() => {
    OrderFields.id : id,
    OrderFields.name : name,
    OrderFields.orderTime : orderTime.toIso8601String(),
    OrderFields.completed : completed,
    OrderFields.customer : customer
  };
}