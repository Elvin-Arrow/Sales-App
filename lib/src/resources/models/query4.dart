import 'dart:convert';

class Query4 {
  final int month;
  final int day;
  final int sales;

  String get monthSrting => month.toString();

  Query4(this.month, this.day, this.sales);

  Map<String, dynamic> toMap() {
    return {
      'month': month,
      'day': day,
      'sales': sales,
    };
  }

  factory Query4.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Query4(
      map['month'],
      map['day'],
      map['sales'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Query4.fromJson(String source) => Query4.fromMap(json.decode(source));
}
