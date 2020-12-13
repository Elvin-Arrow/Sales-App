import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_app/src/Ui/widgets/constraint_dropdown.dart';
import 'package:sales_app/src/cubit/control_cubit.dart';
import 'package:sales_app/src/utilities/constants.dart';

class Operations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text('Sales Explorer'),
          Row(
            children: [
              Text('Select query parameter'),
              SizedBox(
                width: 24.0,
              ),
              ConstraintDropdown(
                hintText: 'Query parameter',
                items: ['Time', 'Location', 'Item'],
                onChanged: (val) {
                  context
                      .read<ControlCubit>()
                      .showControls(_stringToQueryControl(val));
                },
              ),
            ],
          ),
          BlocBuilder<ControlCubit, ControlState>(
            builder: (_, state) {
              List<Widget> controls;
              if (state is TimeControl) {
              } else if (state is LocationControl) {
              } else if (state is ItemControl) {}

              return controls != null
                  ? Row(
                      children: controls,
                    )
                  : Container();
            },
          ),
        ],
      ),
    );
  }

  QueryControls _stringToQueryControl(String controlString) {
    if (controlString == 'Time')
      return QueryControls.Time;
    else if (controlString == 'Location')
      return QueryControls.Location;
    else
      return QueryControls.Item;
  }

  Widget _getControl() {
    return ListTile(
      leading: Text('Sort by: '),
      title: ConstraintDropdown(
        items: [],
        onChanged: (val) {},
      ),
    );
  }

  List<String> _getTimeValues() {
    return [
      'Year',
      'Month',
      'Quarter',
      'Day',
    ];
  }

  List<String> _getLocationValues() {
    return [
      'Country',
      'State / Province',
      'City',
      'Street',
    ];
  }

  List<String> _getItemValues() {}
}
