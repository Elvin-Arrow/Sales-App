import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_app/pages/home_page.dart';

import 'package:sales_app/providers/button_provider.dart';
import 'package:sales_app/providers/region_provider.dart';
import 'package:sales_app/src/app.dart';

void main() {
  runApp(App());
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
