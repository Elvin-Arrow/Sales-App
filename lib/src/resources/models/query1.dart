import 'dart:convert';

class Query1 {
  final int year;
  final int quarter;
  final int sales;

  Query1(this.year, this.quarter, this.sales);

  String get quarterString => quarter.toString();

  Map<String, dynamic> toMap() {
    return {
      'year': year,
      'quarter': quarter,
      'sales': sales,
    };
  }

  factory Query1.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Query1(
      map['year'],
      map['quarter'],
      map['sales'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Query1.fromJson(String source) => Query1.fromMap(json.decode(source));
}
