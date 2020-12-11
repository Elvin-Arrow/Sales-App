import 'package:flutter/material.dart';

class ConstraintDropdown extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final String value;
  final Function onChanged;

  const ConstraintDropdown(
      {Key key,
      @required this.items,
      this.hintText,
      this.value,
      @required this.onChanged})
      : super(key: key);

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
          value: this.value,
          hint: Text(hintText),
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          elevation: 12,
          onChanged: this.onChanged,
          icon: Icon(Icons.arrow_downward),
        ),
      ),
    );
  }
}
