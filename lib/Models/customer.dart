const String tableCustomer = 'customers';

class CustomerFields{
  static final List<String> values =[
    id, name, email, age, premium, createdAt
  ];

  static const String id = '_id';
  static const String name = 'name';
  static const String email = 'email';
  static const String age = 'age';
  static const String premium = 'premium';
  static const String createdAt = 'createdAt';
}

class Customer{
   final int? id;
   final String? name;
   final String? email;
   final int? age;
   final bool? premium;
   final DateTime createdAt;

  const Customer(
      { required this.id,
        required this.name,
        required this.email,
        required this.age,
        required this.premium,
        required this.createdAt});

  Customer copy({
    int? id,
    String? name,
    String? email,
    int? age,
    bool? premium,
    DateTime? createdAt
  }) => Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      premium: premium ?? this.premium,
      createdAt: createdAt ?? this.createdAt);

  static Customer fromJson(Map<String, Object?> json) => Customer(
    id: json[CustomerFields.id] as int?,
    name:  json[CustomerFields.name] as String?,
    email:  json[CustomerFields.email] as String?,
    age:  json[CustomerFields.age] as int?,
    premium: json[CustomerFields.premium] as bool?,
    createdAt: DateTime.parse(json[CustomerFields.createdAt] as String),
  );

  Map<String, Object?> toJson() => {
    CustomerFields.id: id,
    CustomerFields.name: name,
    CustomerFields.email: email,
    CustomerFields.age: age,
    CustomerFields.premium: premium,
    CustomerFields.createdAt: createdAt.toIso8601String()
  };
}