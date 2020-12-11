import 'package:flutter/cupertino.dart';
import 'package:sales_app/models/region.dart';
import 'package:sales_app/models/regional_sales.dart';

class RegionProvider extends ChangeNotifier {
  Region region;
  List<RegionalSale> regionalSales = [];

  RegionProvider() {
    region = Region();
  }

  void setCountry(String val) {
    region.country = val;
    notifyListeners();
  }

  void setCity(String val) {
    region.city = val;
    notifyListeners();
  }

  void setState(String val) {
    region.zip = val;
    notifyListeners();
  }

  void addSale(List salesMap) {
    List<RegionalSale> sales = [];

    for (Map<String, dynamic> sale in salesMap) {
      final temp = RegionalSale.fromMap(sale);

      sales.add(temp);
    }

    regionalSales.addAll(sales);
    notifyListeners();
  }
}
