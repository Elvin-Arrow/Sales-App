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
              if (state is TimeControl) {
                return _getControl(QueryControls.Time, state.controlParameter);
              } else if (state is LocationControl) {
                return _getControl(
                    QueryControls.Location, state.controlParameter);
              } else if (state is ItemControl) {
                return _getControl(QueryControls.Item, state.controlParameter);
              }

              // Show no control by default
              return Container();
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

  Widget _getControl(QueryControls queryControl, String controlParameter) {
    List<String> items;

    switch (queryControl) {
      case QueryControls.Time:
        items = _getTimeValues();
        break;

      case QueryControls.Location:
        items = _getLocationValues();
        break;

      case QueryControls.Item:
        items = _getItemValues();
        break;
      default:
    }
    return Row(
      children: [
        Text('Sort by: '),
        SizedBox(
          width: 24.0,
        ),
        ConstraintDropdown(
          items: items,
          onChanged: (val) {
            // TODO Update dropdown value and show content
          },
        ),
      ],
    );
  }

  List<String> _getTimeValues() {
    return ['Year', 'Month', 'Quarter', 'Day'];
  }

  List<String> _getLocationValues() {
    return ['Country', 'State / Province', 'City', 'Street'];
  }

  List<String> _getItemValues() {
    return ['Brand', 'Type', 'Item Name'];
  }
}
