import 'package:flutter/cupertino.dart';
import 'package:sales_app/models/button_state.dart';

class ButtonProvider extends ChangeNotifier {
  List<ButtonState> buttonStates = [];

  ButtonState getButtonState(Key key, {bool selected = false}) {
    final state = _lookupState(key);

    if (state != null)
      return state;
    else
      buttonStates.add(ButtonState(key, isSelected: selected));

    return buttonStates.last;
  }

  ButtonState _lookupState(Key key) {
    for (ButtonState state in buttonStates) {
      if (state.key == key) return state;
    }
    return null;
  }

  void toggleButtonState(Key key) {
    final previousSelect = buttonStates.where((element) => element.isSelected);

    for (final state in previousSelect) {
      state.toggleSelcted();
    }

    final item = buttonStates.where((element) => element.key == key);

    for (ButtonState state in item) {
      state.toggleSelcted();
    }

    notifyListeners();
  }
}
