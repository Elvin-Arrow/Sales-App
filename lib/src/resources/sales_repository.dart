// ignore: unused_import
import 'dart:convert';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:sales_app/src/resources/models/query1.dart';
import 'package:sales_app/src/resources/models/query2.dart';
import 'package:sales_app/src/resources/models/query3.dart';
import 'package:sales_app/src/resources/models/query4.dart';
import 'package:sales_app/src/resources/models/query5.dart';
import 'package:sales_app/src/resources/models/query6.dart';
import 'package:sales_app/src/resources/models/yearl_sales.dart';
import 'package:sales_app/src/utilities/constants.dart';

class SalesRepository {
  Future<List<YearlySales>> getYearlySales() async {
    List<YearlySales> sales = [];
    // TODO Enable data fetch after testing
    final rawJson = await http.get('http://127.0.0.1:5000/yearly/');
    final parsedJson = jsonDecode(rawJson.body);

    for (final sale in parsedJson) {
      sales.add(YearlySales.fromMap(sale));
    }

    await Future.delayed(Duration(seconds: 1));
    return sales ?? [];
  }

  getData(Sale saleType) {
    switch (saleType) {
      case Sale.Year:
        return fetchQuery1();
        break;

      case Sale.Quarter:
        return fetchQuery1();
        break;
      case Sale.Month:
        return fetchQuery4();
        break;
      case Sale.Day:
        return fetchQuery4();
        break;
      case Sale.Country:
        return fetchQuery2();
        break;
      case Sale.State:
        return fetchQuery2();
        break;
      case Sale.City:
        return fetchQuery2();
        break;
      case Sale.Street:
        return fetchQuery6();
        break;
      case Sale.ItemBrand:
        return fetchQuery3();
        break;
      case Sale.ItemType:
        return fetchQuery3();
        break;
      case Sale.ItemName:
        return fetchQuery5();
        break;
      default:
    }
  }

  Future<List<Query1>> fetchQuery1() async {
    List<Query1> sales = [];

    final rawJson = await http.get('http://127.0.0.1:5000/query1/');
    final parsedJson = jsonDecode(rawJson.body);

    for (final sale in parsedJson) {
      sales.add(Query1.fromMap(sale));
    }

    await Future.delayed(Duration(seconds: 1));
    return sales ?? [];
  }

  Future<List<Query2>> fetchQuery2() async {
    List<Query2> sales = [];

    final rawJson = await http.get('http://127.0.0.1:5000/query2/');
    final parsedJson = jsonDecode(rawJson.body);

    for (final sale in parsedJson) {
      sales.add(Query2.fromMap(sale));
    }

    await Future.delayed(Duration(seconds: 1));
    return sales ?? [];
  }

  Future<List<Query3>> fetchQuery3() async {
    List<Query3> sales = [];

    final rawJson = await http.get('http://127.0.0.1:5000/query3/');
    final parsedJson = jsonDecode(rawJson.body);

    for (final sale in parsedJson) {
      sales.add(Query3.fromMap(sale));
    }

    await Future.delayed(Duration(seconds: 1));
    return sales ?? [];
  }

  Future<List<Query4>> fetchQuery4() async {
    List<Query4> sales = [];

    final rawJson = await http.get('http://127.0.0.1:5000/query4/');
    final parsedJson = jsonDecode(rawJson.body);

    for (final sale in parsedJson) {
      sales.add(Query4.fromMap(sale));
    }

    await Future.delayed(Duration(seconds: 1));
    return sales ?? [];
  }

  Future<List<Query5>> fetchQuery5() async {
    List<Query5> sales = [];

    final rawJson = await http.get('http://127.0.0.1:5000/query5/');
    final parsedJson = jsonDecode(rawJson.body);

    for (final sale in parsedJson) {
      sales.add(Query5.fromMap(sale));
    }

    await Future.delayed(Duration(seconds: 1));
    return sales ?? [];
  }

  Future<List<Query6>> fetchQuery6() async {
    List<Query6> sales = [];

    final rawJson = await http.get('http://127.0.0.1:5000/query6/');
    final parsedJson = jsonDecode(rawJson.body);

    for (final sale in parsedJson) {
      sales.add(Query6.fromMap(sale));
    }

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
