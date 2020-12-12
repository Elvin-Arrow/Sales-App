import 'dart:convert';

class Location {
  final String street;
  final String city;
  final String province;
  final String country;

  Location(this.street, this.city, this.province, this.country);

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'city': city,
      'province': province,
      'country': country,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Location(
      map['street'],
      map['city'],
      map['province'],
      map['country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source));
}
