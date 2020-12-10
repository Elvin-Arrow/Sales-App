import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_app/models/button_state.dart';
import 'package:sales_app/models/model.dart';
import 'package:sales_app/providers/button_provider.dart';

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
          ConstraintDropdown(
            items: ['United States'],
            hintText: 'Country',
          ),
          ConstraintDropdown(
            items: [
              'ABINGTON',
              'ACCORD',
              'ACTON',
              'ACUSHNET',
              'ADAMS',
              'AGAWAM',
              'ALLSTON',
              'AMESBURY',
              'AMHERST',
              'AMHERST',
              'AMHERST',
              'ANDOVER',
              'ARLINGTON',
              'ARLINGTON HEIGHTS',
              'ASHBURNHAM',
              'ASHBY',
              'ASHFIELD',
              'ASHLAND',
              'ASHLEY FALLS',
              'ASSONET',
              'ATHOL',
              'ATTLEBORO',
              'ATTLEBORO FALLS',
              'AUBURN',
              'AUBURNDALE',
              'AVON',
              'AYER',
              'BABSON PARK',
              'BALDWINVILLE',
              'BARNSTABLE',
              'BARRE',
              'BECKET',
              'BEDFORD',
              'BELCHERTOWN',
              'BELLINGHAM',
              'BELMONT',
              'BERKLEY',
              'BERKSHIRE',
              'BERLIN',
              'BERNARDSTON',
              'BEVERLY',
              'BILLERICA',
              'BLACKSTONE',
              'BLANDFORD',
            ],
            hintText: 'City',
          ),
          ConstraintDropdown(
            items: ['Zip code'],
            hintText: 'Zip code',
          ),
        ],
      ),

      SizedBox(
        height: 24.0,
      ),
      Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {},
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
      DataTable(
        columns: [
          DataColumn(
            label: Text('Country'),
          ),
          DataColumn(
            label: Text('City'),
          ),
          DataColumn(
            label: Text('Zip'),
          ),
        ],
        rows: [
          DataRow(
            cells: [
              DataCell(
                Text('United States'),
              ),
              DataCell(
                Text('BEDFORD'),
              ),
              DataCell(
                Text('123456'),
              ),
            ],
          ),
        ],
      ),
    ];
  }

  Widget _getChart() {
    var data = [
      ModelClass('2016', 12, Colors.red),
      ModelClass('2017', 42, Colors.yellow),
      ModelClass('2018', 52, Colors.green),
    ];

    var series = [
      charts.Series(
        domainFn: (ModelClass clickData, _) => clickData.year,
        measureFn: (ModelClass clickData, _) => clickData.clicks,
        colorFn: (ModelClass clickData, _) => clickData.color,
        id: 'Clicks',
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
}

class ConstraintDropdown extends StatefulWidget {
  final List<String> items;
  final String hintText;

  const ConstraintDropdown({
    Key key,
    @required this.items,
    this.hintText,
  }) : super(key: key);

  @override
  _ConstraintDropdownState createState() => _ConstraintDropdownState();
}

class _ConstraintDropdownState extends State<ConstraintDropdown> {
  String selectedItem;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 34.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: DropdownButton(
          value: selectedItem,
          hint: Text(widget.hintText),
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          elevation: 12,
          onChanged: (value) {
            setState(() {
              selectedItem = value;
            });
          },
          icon: Icon(Icons.arrow_downward),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    @required this.key,
    @required this.onPressed,
    this.text,
    this.buttonState,
    this.borderRadius,
    this.padding,
    this.internalPadding,
  });

  final Key key;
  final VoidCallback onPressed;
  final String text;
  final ButtonState buttonState;
  final BorderRadius borderRadius;
  final EdgeInsets internalPadding;
  final EdgeInsets padding;

  ButtonState get state => buttonState;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.padding,
      child: RawMaterialButton(
        onPressed: this.onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: this.borderRadius ?? BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: this.internalPadding ?? EdgeInsets.all(8.0),
          child: Text(
            this.text ?? '',
            style: TextStyle(
              fontSize: 16.0,
              color: buttonState.textColour,
            ),
          ),
        ),
      ),
    );
  }
}
