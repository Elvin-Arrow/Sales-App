import 'package:flutter/material.dart';

import 'package:sales_app/src/Ui/widgets/simple_chart.dart';
import 'package:sales_app/src/utilities/constants.dart';

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
  final Sale salesType;
  final List data;

  const MaterialBarChart({
    Key key,
    this.width = 500.0,
    this.height = 350.0,
    this.barColour = Colors.blue,
    this.title = '',
    @required this.salesType,
    @required this.data,
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
            Text(
              this.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Flexible(child: _getChart()),
          ],
        ),
        // child: SimpleBarChart.fromData(yearlySales, this.barColour),
      ),
    );
  }

  Widget _getChart() {
    switch (salesType) {
      case Sale.Default:
        return SimpleBarChart.fromData(data, this.barColour);
        break;
      case Sale.Year:
        return SimpleBarChart.forQuery1(data, Colors.blue);
        break;

      case Sale.Quarter:
        return SimpleBarChart.forQuery1(data, Colors.blue);
        break;
      case Sale.Month:
        return SimpleBarChart.forQuery4(data, Colors.blue);
        break;
      case Sale.Day:
        return SimpleBarChart.forQuery4(data, Colors.blue);
        break;
      case Sale.Country:
        return SimpleBarChart.forQuery2(data, Colors.blue);
        break;
      case Sale.State:
        return SimpleBarChart.forQuery2(data, Colors.blue);
        break;
      case Sale.City:
        return SimpleBarChart.forQuery2(data, Colors.blue);
        break;
      case Sale.Street:
        return SimpleBarChart.forQuery6(data, Colors.blue);
        break;
      case Sale.ItemBrand:
        return SimpleBarChart.forQuery3(data, Colors.blue);
        break;
      case Sale.ItemType:
        return SimpleBarChart.forQuery3(data, Colors.blue);
        break;
      case Sale.ItemName:
        return SimpleBarChart.forQuery5(data, Colors.blue);
        break;
      default:
        return Container();
    }
  }
}
