import 'dart:convert';

class Query5 {
  final String itemName;
  final int quantity;
  final int sales;

  Query5(this.itemName, this.quantity, this.sales);

  Map<String, dynamic> toMap() {
    return {
      'itemName': itemName,
      'quantity': quantity,
      'sales': sales,
    };
  }

  factory Query5.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Query5(
      map['itemName'],
      map['quantity'],
      map['sales'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Query5.fromJson(String source) => Query5.fromMap(json.decode(source));
}
