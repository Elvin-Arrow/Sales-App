import 'package:flutter/material.dart';
import 'package:sales_app/src/Ui/widgets/simple_chart.dart';
import 'package:sales_app/src/resources/models/yearl_sales.dart';

class Dashboard extends StatelessWidget {
  final List<YearlySales> yearlySales;

  Dashboard({this.yearlySales});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 36.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _getRegionalSalesContent(context),
        ),
      ),
    );
  }

  List<Widget> _getRegionalSalesContent(BuildContext context) {
    return [
      // Title
      Text(
        'Sales overview',
        style: TextStyle(
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
        ),
      ),

      SizedBox(
        height: 24.0,
      ),

      // Bar charts
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              height: 350,
              width: 500,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: SimpleBarChart.fromData(yearlySales, Colors.redAccent),
            ),
          ),
          Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              height: 350,
              width: 500,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: SimpleBarChart.fromData(yearlySales, Colors.blue),
            ),
          ),
        ],
      ),

      SizedBox(
        height: 24.0,
      ),

      Center(
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            height: 350,
            width: 1000,
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: SimpleBarChart.fromData(yearlySales, Colors.teal),
          ),
        ),
      ),
      Spacer(),
    ];
  }
}
