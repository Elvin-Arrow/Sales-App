import 'dart:convert';

class Query3 {
  final String brand;
  final String type;
  final int sales;

  Query3(this.brand, this.type, this.sales);

  Map<String, dynamic> toMap() {
    return {
      'brand': brand,
      'type': type,
      'sales': sales,
    };
  }

  factory Query3.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Query3(
      map['brand'],
      map['type'],
      map['sales'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Query3.fromJson(String source) => Query3.fromMap(json.decode(source));
}
