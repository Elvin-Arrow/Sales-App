import 'dart:convert';

class Time {
  final String day;
  final String dayOfWeek;
  final String month;
  final String quarter;
  final String year;

  Time(this.day, this.dayOfWeek, this.month, this.quarter, this.year);

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'dayOfWeek': dayOfWeek,
      'month': month,
      'quarter': quarter,
      'year': year,
    };
  }

  factory Time.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Time(
      map['day'],
      map['dayOfWeek'],
      map['month'],
      map['quarter'],
      map['year'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Time.fromJson(String source) => Time.fromMap(json.decode(source));
}
