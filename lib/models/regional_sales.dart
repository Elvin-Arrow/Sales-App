import 'dart:convert';

import 'package:sales_app/models/region.dart';

class RegionalSale extends Region {
  final int totalSales;
  final String country;
  final String city;

  RegionalSale(this.totalSales, this.country, this.city);

  Map<String, dynamic> toMap() {
    return {
      'totalSales': totalSales,
      'country': country,
      'city': city,
    };
  }

  factory RegionalSale.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RegionalSale(
      map['totalSales'],
      map['country'],
      map['city'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegionalSale.fromJson(String source) =>
      RegionalSale.fromMap(json.decode(source));

  @override
  String toString() =>
      'RegionalSale(totalSales: $totalSales, country: $country, city: $city)';
}
