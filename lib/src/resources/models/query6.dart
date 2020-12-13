import 'dart:convert';

class Query6 {
  final String street;
  final int sales;

  Query6(this.street, this.sales);

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'sales': sales,
    };
  }

  factory Query6.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Query6(
      map['street'],
      map['sales'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Query6.fromJson(String source) => Query6.fromMap(json.decode(source));
}
