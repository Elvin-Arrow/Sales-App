import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_app/src/Ui/widgets/dashboard.dart';
import 'package:sales_app/src/Ui/widgets/operations.dart';
import 'package:sales_app/src/cubit/page_cubit.dart';
import 'package:sales_app/src/utilities/constants.dart';
import 'package:sales_app/src/Ui/widgets/primary_button.dart';

class Sidebar extends StatelessWidget {
  final double width;
  final View view;

  const Sidebar({
    Key key,
    @required this.width,
    @required this.view,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      width: this.width,
      height: MediaQuery.of(context).size.width,
      child: Column(
        children: _getSidebarItems(context),
      ),
    );
  }

  List<Widget> _getSidebarItems(BuildContext context) {
    return [
      SizedBox(
        height: 24.0,
      ),
      CircularProfileAvatar('assets/images/logo.jpeg'),
      SizedBox(
        height: 24.0,
      ),
      Text(
        'Q Next',
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.white,
        ),
      ),
      Spacer(),
      BlocBuilder<PageCubit, PageState>(
        builder: (_, state) {
          Color buttonTextColour;
          if (state is ShowDashboard || state is PageInitial) {
            buttonTextColour = Colors.tealAccent;
          } else {
            buttonTextColour = Colors.white;
          }
          return PrimaryButton(
            key: null,
            onPressed: () {
              final pageCubit = context.read<PageCubit>();
              pageCubit.showDashboard();
            },
            text: 'Dashboard',
            textColour: buttonTextColour,
          );
        },
      ),
      SizedBox(
        height: 24.0,
      ),
      BlocBuilder<PageCubit, PageState>(
        builder: (_, state) {
          Color buttonTextColour;
          if (state is ShowOperations) {
            buttonTextColour = Colors.tealAccent;
          } else {
            buttonTextColour = Colors.white;
          }
          return PrimaryButton(
            key: null,
            onPressed: () {
              final pageCubit = context.read<PageCubit>();
              pageCubit.showOperations();
            },
            text: 'Sales Details',
            textColour: buttonTextColour,
          );
        },
      ),
      Spacer()
    ];
  }
}
