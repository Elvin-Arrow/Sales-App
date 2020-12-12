import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_app/src/Ui/home_page.dart';
import 'package:sales_app/src/cubit/page_cubit.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (_) => PageCubit(),
        ),
      ], child: HomePage()),
    );
  }
}