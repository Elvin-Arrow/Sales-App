import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
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
