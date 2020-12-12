import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_app/providers/button_provider.dart';
import 'package:sales_app/widgets/primary_button.dart';

class Sidebar extends StatelessWidget {
  final double width;

  const Sidebar({Key key, @required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
        child: Column(
          children: _getSidebarItems(context),
        ),
      ),
    );
  }

  List<Widget> _getSidebarItems(BuildContext context) {
    return [
      CircularProfileAvatar('assets/images/logo.png'),
      Text(
        'The leggars',
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.white,
        ),
      ),
      Spacer(),
      Consumer<ButtonProvider>(
        builder: (_, buttonProvider, child) {
          final key = Key('dashboard_btn');
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
            text: 'Dashboard',
          );
        },
      ),
      SizedBox(
        height: 24.0,
      ),
      Consumer<ButtonProvider>(
        builder: (_, buttonProvider, child) {
          final key = Key('detailed_sales_btn');
          return PrimaryButton(
            key: key,
            onPressed: () {
              Provider.of<ButtonProvider>(context, listen: false)
                  .toggleButtonState(key);
            },
            buttonState: buttonProvider.getButtonState(
              key,
            ),
            text: 'Sales Details',
          );
        },
      ),
      Spacer()
    ];
  }
}
