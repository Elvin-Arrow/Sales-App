// ignore: unused_import
import 'dart:convert';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:sales_app/src/resources/models/yearl_sales.dart';

class SalesRepository {
  Future<List<YearlySales>> getYearlySales() async {
    List<YearlySales> sales = [];
    // TODO Enable data fetch after testing
    /* final rawJson = await http.get('http://127.0.0.1:5000/yearly/');
    final parsedJson = jsonDecode(rawJson.body);

    
    for (final sale in parsedJson) {
      sales.add(YearlySales.fromMap(sale));
    } */

    await Future.delayed(Duration(seconds: 1));
    return sales ?? [];
  }

  /* Sales getQuarterlySales() {}

  Sales getMonthylSales() {}

  Sales getDailySales() {}

  Sales getCountrySales() {}

  Sales getCitySales() {}

  Sales getStoreSales() {}

  Sales getSalesByBrand() {}

  Sales getSalesByItemType() {}

  Sales getSalesByItem() {} */
}
