import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:sales_app/src/resources/models/query1.dart';
import 'package:sales_app/src/resources/models/query2.dart';
import 'package:sales_app/src/resources/models/query3.dart';
import 'package:sales_app/src/resources/models/query4.dart';
import 'package:sales_app/src/resources/models/query5.dart';
import 'package:sales_app/src/resources/models/query6.dart';
import 'package:sales_app/src/resources/models/yearl_sales.dart';

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
      animate: true,
    );
  }

  factory SimpleBarChart.fromData(List<YearlySales> sales, Color colour) {
    return SimpleBarChart(
      _feedData(
        sales,
        charts.Color(
            r: colour.red, g: colour.green, b: colour.blue, a: colour.alpha),
      ),
      animate: true,
    );
  }

  factory SimpleBarChart.forYearlySale(List<YearlySales> sales, Color colour) {
    return SimpleBarChart(
      _feedData(
        sales,
        charts.Color(
            r: colour.red, g: colour.green, b: colour.blue, a: colour.alpha),
      ),
      animate: true,
    );
  }

  factory SimpleBarChart.forRegionalSale(
      List<YearlySales> sales, Color colour) {
    return SimpleBarChart(
      _feedData(
        sales,
        charts.Color(
            r: colour.red, g: colour.green, b: colour.blue, a: colour.alpha),
      ),
      animate: true,
    );
  }

  factory SimpleBarChart.forQuery1(List<Query1> sales, Color colour) {
    return SimpleBarChart(
      _query1Data(
        sales,
        charts.Color(
            r: colour.red, g: colour.green, b: colour.blue, a: colour.alpha),
      ),
      animate: true,
    );
  }

  factory SimpleBarChart.forQuery2(List<Query2> sales, Color colour) {
    return SimpleBarChart(
      _query2Data(
        sales,
        charts.Color(
            r: colour.red, g: colour.green, b: colour.blue, a: colour.alpha),
      ),
      animate: true,
    );
  }
  factory SimpleBarChart.forQuery3(List<Query3> sales, Color colour) {
    return SimpleBarChart(
      _query3Data(
        sales,
        charts.Color(
            r: colour.red, g: colour.green, b: colour.blue, a: colour.alpha),
      ),
      animate: true,
    );
  }
  factory SimpleBarChart.forQuery4(List<Query4> sales, Color colour) {
    return SimpleBarChart(
      _query4Data(
        sales,
        charts.Color(
            r: colour.red, g: colour.green, b: colour.blue, a: colour.alpha),
      ),
      animate: true,
    );
  }
  factory SimpleBarChart.forQuery5(List<Query5> sales, Color colour) {
    return SimpleBarChart(
      _query5Data(
        sales,
        charts.Color(
            r: colour.red, g: colour.green, b: colour.blue, a: colour.alpha),
      ),
      animate: true,
    );
  }
  factory SimpleBarChart.forQuery6(List<Query6> sales, Color colour) {
    return SimpleBarChart(
      _query6Data(
        sales,
        charts.Color(
            r: colour.red, g: colour.green, b: colour.blue, a: colour.alpha),
      ),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  static List<charts.Series<YearlySales, String>> _feedData(
      List<YearlySales> sales, charts.Color colour) {
    return [
      new charts.Series<YearlySales, String>(
        id: 'Sales',
        colorFn: (_, __) => colour,
        domainFn: (YearlySales sales, _) => sales.yearString,
        measureFn: (YearlySales sales, _) => sales.sales,
        data: sales,
      )
    ];
  }

  static List<charts.Series<Query1, String>> _query1Data(
      List<Query1> sales, charts.Color colour) {
    return [
      new charts.Series<Query1, String>(
        id: 'Sales',
        colorFn: (_, __) => colour,
        domainFn: (Query1 sales, _) => sales.quarterString,
        measureFn: (Query1 sales, _) => sales.sales,
        data: sales,
      )
    ];
  }

  static List<charts.Series<Query2, String>> _query2Data(
      List<Query2> sales, charts.Color colour) {
    return [
      new charts.Series<Query2, String>(
        id: 'Sales',
        colorFn: (_, __) => colour,
        domainFn: (Query2 sales, _) => sales.city,
        measureFn: (Query2 sales, _) => sales.sales,
        data: sales,
      )
    ];
  }

  static List<charts.Series<Query3, String>> _query3Data(
      List<Query3> sales, charts.Color colour) {
    return [
      new charts.Series<Query3, String>(
        id: 'Sales',
        colorFn: (_, __) => colour,
        domainFn: (Query3 sales, _) => sales.brand,
        measureFn: (Query3 sales, _) => sales.sales,
        data: sales,
      )
    ];
  }

  static List<charts.Series<Query4, String>> _query4Data(
      List<Query4> sales, charts.Color colour) {
    return [
      new charts.Series<Query4, String>(
        id: 'Sales',
        colorFn: (_, __) => colour,
        domainFn: (Query4 sales, _) => sales.monthSrting,
        measureFn: (Query4 sales, _) => sales.sales,
        data: sales,
      )
    ];
  }

  static List<charts.Series<Query5, String>> _query5Data(
      List<Query5> sales, charts.Color colour) {
    return [
      new charts.Series<Query5, String>(
        id: 'Sales',
        colorFn: (_, __) => colour,
        domainFn: (Query5 sales, _) => sales.itemName,
        measureFn: (Query5 sales, _) => sales.sales,
        data: sales,
      )
    ];
  }

  static List<charts.Series<Query6, String>> _query6Data(
      List<Query6> sales, charts.Color colour) {
    return [
      new charts.Series<Query6, String>(
        id: 'Sales',
        colorFn: (_, __) => colour,
        domainFn: (Query6 sales, _) => sales.street,
        measureFn: (Query6 sales, _) => sales.sales,
        data: sales,
      )
    ];
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
