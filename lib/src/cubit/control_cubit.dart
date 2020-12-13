import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sales_app/src/utilities/constants.dart';

part 'control_state.dart';

class ControlCubit extends Cubit<ControlState> {
  ControlCubit() : super(ControlInitial());

  void showControls(QueryControls controls) {
    switch (controls) {
      case QueryControls.Time:
        _showTimeControls();
        break;

      case QueryControls.Location:
        _showLocationControls();
        break;

      case QueryControls.Item:
        _showItemControls();
        break;
      default:
    }
  }

  void _showTimeControls() {
    emit(TimeControl());
  }

  void _showLocationControls() {
    emit(LocationControl());
  }

  void _showItemControls() {
    emit(ItemControl());
  }
}
