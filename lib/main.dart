import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(24.0),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.circular(12.0),
        child: Row(
          children: [
            // Side bar
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF1D1943),
                borderRadius: BorderRadius.circular(12.0),
              ),
              width: MediaQuery.of(context).size.width * 0.25,
              height: double.infinity,
              child: Column(
                children: _getSidebarItems(context),
              ),
            ),

            // Body
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: _getRegionalSalesContent(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getSidebarItems(BuildContext context) {
    return [
      Text('Logo'),
      Text('Company Name'),
      Spacer(),
      TextButton(
        onPressed: () {},
        child: Text('Regional Sales'),
      ),
      TextButton(
        onPressed: () {},
        child: Text('Brand Sales'),
      ),
      TextButton(
        onPressed: () {},
        child: Text('Yearly Sales'),
      ),
      Spacer()
    ];
  }

  List<Widget> _getRegionalSalesContent(BuildContext context) {
    return [];
  }
}
