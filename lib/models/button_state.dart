import 'package:flutter/material.dart';

class ButtonState {
  final Key key;
  Color _textColour;
  bool _isSelected;

  ButtonState(this.key, {Color textColour, bool isSelected = false}) {
    _textColour = isSelected ? Colors.purpleAccent : Colors.white;
    _isSelected = isSelected;
  }

  bool get isSelected => _isSelected;
  Color get textColour => _textColour;

  void toggleSelcted() {
    _isSelected = !_isSelected;
    _textColour =
        _textColour == Colors.white ? Colors.purpleAccent : Colors.white;
  }
}
