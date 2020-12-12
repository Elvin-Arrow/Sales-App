import 'dart:convert';

class Item {
  final String name;
  final String brand;
  final String type;
  final String supplierType;

  Item(this.name, this.brand, this.type, this.supplierType);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'brand': brand,
      'type': type,
      'supplier_type': supplierType,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Item(
      map['name'],
      map['brand'],
      map['type'],
      map['supplier_type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}
