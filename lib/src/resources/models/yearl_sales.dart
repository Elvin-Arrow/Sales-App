import 'dart:convert';

class YearlySales {
  final int year;
  final double sales;

  YearlySales(this.year, this.sales);

  String get yearString => year.toString();

  Map<String, dynamic> toMap() {
    return {
      'year': year,
      'sales': sales,
    };
  }

  factory YearlySales.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return YearlySales(
      map['year'],
      map['sales'],
    );
  }

  String toJson() => json.encode(toMap());

  factory YearlySales.fromJson(String source) =>
      YearlySales.fromMap(json.decode(source));
}
