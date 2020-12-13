import 'package:flutter/material.dart';
import 'package:sales_app/src/Ui/widgets/simple_chart.dart';

/// A [SimpleBarChart] widget wrapped with [Material] widget to give the chart
/// a card like look.
///
/// Default [height] is 350.0, default[width] is 500.0 and default [barColour]
/// is [Colors.blue].
///
class MaterialBarChart extends StatelessWidget {
  final double width;
  final double height;
  final Color barColour;
  final String title;

  const MaterialBarChart({
    Key key,
    this.width = 500.0,
    this.height = 350.0,
    this.barColour = Colors.blue,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        height: this.height,
        width: this.width,
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        // TODO Replace the dummy chart with actual chart
        child: Column(
          children: [
            Text(this.title),
            SizedBox(
              height: 12.0,
            ),
            Flexible(child: SimpleBarChart.withSampleData()),
          ],
        ),
        // child: SimpleBarChart.fromData(yearlySales, this.barColour),
      ),
    );
  }
}
