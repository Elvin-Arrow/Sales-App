import 'dart:convert';

class Query2 {
  final String country;
  final String city;
  final int sales;

  Query2(this.country, this.city, this.sales);

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'city': city,
      'sales': sales,
    };
  }

  factory Query2.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Query2(
      map['country'],
      map['city'],
      map['sales'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Query2.fromJson(String source) => Query2.fromMap(json.decode(source));
}
