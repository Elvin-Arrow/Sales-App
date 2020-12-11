import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_app/models/model.dart';
import 'package:sales_app/providers/button_provider.dart';
import 'package:sales_app/providers/region_provider.dart';
import 'package:sales_app/widgets/constraint_dropdown.dart';
import 'package:sales_app/widgets/primary_button.dart';
import 'package:sales_app/models/regional_sales.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ButtonProvider()),
        ChangeNotifierProvider(create: (_) => RegionProvider()),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
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
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF250C4F),
                    Color(0xFF1D1943),
                  ],
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              width: MediaQuery.of(context).size.width * 0.20,
              height: double.infinity,
              child: Column(
                children: _getSidebarItems(context),
              ),
            ),

            // Body
            Expanded(
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
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getSidebarItems(BuildContext context) {
    return [
      Text('Logo'),
      Text(
        'Company Name',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
        ),
      ),
      Spacer(),
      Consumer<ButtonProvider>(
        builder: (_, buttonProvider, child) {
          final key = Key('regional_sales');
          return PrimaryButton(
            key: key,
            onPressed: () {
              Provider.of<ButtonProvider>(context, listen: false)
                  .toggleButtonState(key);
            },
            buttonState: buttonProvider.getButtonState(
              key,
              selected: true,
            ),
            text: 'Regional Sales',
          );
        },
      ),
      Consumer<ButtonProvider>(
        builder: (_, buttonProvider, child) {
          final key = Key('brand_sales');
          return PrimaryButton(
            key: key,
            onPressed: () {
              Provider.of<ButtonProvider>(context, listen: false)
                  .toggleButtonState(key);
            },
            buttonState: buttonProvider.getButtonState(
              key,
            ),
            text: 'Brand Sales',
          );
        },
      ),
      Consumer<ButtonProvider>(
        builder: (_, buttonProvider, child) {
          final key = Key('yearly_sales');
          return PrimaryButton(
            key: key,
            onPressed: () {
              Provider.of<ButtonProvider>(context, listen: false)
                  .toggleButtonState(key);
            },
            buttonState: buttonProvider.getButtonState(
              key,
            ),
            text: 'Yearly Sales',
          );
        },
      ),
      Spacer()
    ];
  }

  List<Widget> _getRegionalSalesContent(BuildContext context) {
    return [
      // Title
      Text(
        'Regional Sales',
        style: TextStyle(
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
        ),
      ),

      SizedBox(
        height: 24.0,
      ),

      // Controls
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Consumer<RegionProvider>(
            builder: (_, regionProvider, child) {
              return ConstraintDropdown(
                value: regionProvider.region?.country,
                items: ['United States'],
                hintText: 'Country',
                onChanged: (value) {
                  Provider.of<RegionProvider>(context, listen: false)
                      .setCountry(value);
                },
              );
            },
          ),
          FutureBuilder(
            future: _getCities(),
            builder: (context, snapshot) {
              final List<String> cities = [];
              if (snapshot.hasData) {
                print('Got data');
                print(snapshot.data);
                cities.addAll(snapshot.data);
              }
              return Consumer<RegionProvider>(
                builder: (_, regionProvider, child) {
                  return ConstraintDropdown(
                    value: regionProvider.region.city,
                    items: cities,
                    hintText: 'City',
                    onChanged: (val) {
                      Provider.of<RegionProvider>(context, listen: false)
                          .setCity(val);
                    },
                  );
                },
              );
            },
          ),
          Consumer<RegionProvider>(
            builder: (_, regionProvider, child) {
              return ConstraintDropdown(
                value: regionProvider.region.zip,
                items: [
                  '2351',
                  '2018',
                  '1720',
                  '2743',
                  '1220',
                  '1001',
                  '2134',
                  '1913',
                  '1002',
                  '1003',
                  '1004',
                  '1810',
                  '1812',
                  '1899',
                  '5501',
                  '5544',
                  '2474',
                  '2476',
                  '2475',
                  '1430',
                  '1431',
                  '1330',
                  '1721',
                  '1222',
                  '2702',
                  '1331',
                  '2703',
                  '2763',
                  '1501',
                  '2466',
                  '2322',
                  '1432',
                  '2457',
                  '1436',
                  '2630',
                  '1005',
                  '1223',
                  '1730',
                  '1007',
                  '2019',
                  '2478',
                  '2779',
                  '1224',
                  '1503',
                  '1337',
                  '1915',
                  '1821',
                  '1822',
                  '1504',
                  '1008',
                ],
                hintText: 'Zip code',
                onChanged: (val) {
                  Provider.of<RegionProvider>(context, listen: false)
                      .setState(val);
                },
              );
            },
          ),
        ],
      ),

      SizedBox(
        height: 24.0,
      ),
      Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () async {
            final http.Response rawJson = await http.get(
              'http://localhost:5000/',
            );
            final parsedJson = jsonDecode(rawJson.body);
            // print(parsedJson);
            Provider.of<RegionProvider>(context, listen: false)
                .addSale(parsedJson);
          },
          child: Text('Lookup'),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
            ),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      // Bar chart
      _getChart(),

      // Table
      Expanded(
        child: SingleChildScrollView(
          child: Consumer<RegionProvider>(
            builder: (_, regionProvider, child) {
              List<DataRow> tableContents = [];

              for (RegionalSale sales in regionProvider.regionalSales) {
                tableContents.add(
                  DataRow(
                    cells: [
                      DataCell(
                        Text('${sales.totalSales}'),
                      ),
                      DataCell(
                        Text('${sales.country}'),
                      ),
                      DataCell(
                        Text('${sales.city}'),
                      ),
                    ],
                  ),
                );
              }
              return DataTable(
                columns: [
                  DataColumn(
                    label: Text('Total Sales'),
                  ),
                  DataColumn(
                    label: Text('Year'),
                  ),
                  DataColumn(
                    label: Text('Quarter'),
                  ),
                ],
                rows: tableContents,
              );
            },
          ),
        ),
      ),
    ];
  }

  Widget _getChart() {
    var data = [
      ModelClass(69, '1998', 3, Colors.red),
      ModelClass(115, '1999', 3, Colors.yellow),
      ModelClass(161, '2000', 52, Colors.green),
    ];

    var series = [
      charts.Series(
        domainFn: (ModelClass clickData, _) => clickData.year,
        measureFn: (ModelClass clickData, _) => clickData.totalSales,
        colorFn: (ModelClass clickData, _) => clickData.color,
        id: 'Total sales',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    return Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );
  }

  Future<List<String>> _getCities() async {
    print('Attempting to get cities');
    List<String> cities = [];
    final rawJson = await http.get('http://127.0.0.1:5000/cities');
    final parsedJson = jsonDecode(rawJson.body);

    for (final city in parsedJson) {
      cities.add(city['city']);
    }

    print('Returning');
    return cities;
  }
}
