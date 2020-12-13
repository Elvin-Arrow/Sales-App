import 'package:flutter/material.dart';

class ConstraintDropdown extends StatefulWidget {
  final List<String> items;
  final String hintText;

  final Function onChanged;

  const ConstraintDropdown(
      {Key key,
      @required this.items,
      this.hintText = '',
      @required this.onChanged})
      : super(key: key);

  @override
  _ConstraintDropdownState createState() => _ConstraintDropdownState();
}

class _ConstraintDropdownState extends State<ConstraintDropdown> {
  String selectedVal;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: DropdownButton(
          hint: Text(widget.hintText),
          items: widget.items.map<DropdownMenuItem<String>>((String val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val),
            );
          }).toList(),
          value: selectedVal,
          elevation: 12,
          onChanged: (val) {
            setState(() {
              this.selectedVal = val;
            });
            this.widget.onChanged(val);
          },
        ),
      ),
    );
  }
}
