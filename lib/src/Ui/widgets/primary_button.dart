import 'package:flutter/material.dart';
import 'package:sales_app/src/utilities/constants.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    @required this.key,
    @required this.onPressed,
    this.text,
    this.textColour,
    this.borderRadius,
    this.padding,
    this.internalPadding,
  });

  final Key key;
  final VoidCallback onPressed;
  final String text;
  final Color textColour;

  final BorderRadius borderRadius;
  final EdgeInsets internalPadding;
  final EdgeInsets padding;

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
            style: kSidebarButtonTextStyle.copyWith(
              color: this.textColour,
            ),
          ),
        ),
      ),
    );
  }
}
