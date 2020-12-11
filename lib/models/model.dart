import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ModelClass {
  final int totalSales;
  final int quarter;
  final String year;

  final charts.Color color;

  ModelClass(
    this.totalSales,
    this.year,
    this.quarter,
    Color color,
  ) : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
