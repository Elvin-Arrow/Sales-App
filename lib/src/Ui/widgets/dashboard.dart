import 'package:flutter/material.dart';
import 'package:sales_app/src/Ui/widgets/material_bar_chart.dart';
import 'package:sales_app/src/resources/models/yearl_sales.dart';

class Dashboard extends StatelessWidget {
  final List<YearlySales> yearlySales;
  final BoxConstraints constraints;

  Dashboard({this.yearlySales, this.constraints});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 36.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: _getRegionalSalesContent(context),
            ),
          )
        ],
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
      _getBarCharts(context),

      // Spacer(),
    ];
  }

  Widget _getBarCharts(BuildContext context) {
    final double heightConstraint = MediaQuery.of(context).size.height * 0.4;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialBarChart(
              height: heightConstraint,
            ),
            MaterialBarChart(
              height: heightConstraint,
            ),
          ],
        ),
        SizedBox(
          height: 24.0,
        ),
        Center(
          child: MaterialBarChart(
            height: 500.0,
            barColour: Colors.teal,
          ),
        ),
      ],
    );
  }
}
