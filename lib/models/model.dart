import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ModelClass {
  final String year;
  final int clicks;
  final charts.Color color;

  ModelClass(this.year, this.clicks, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
