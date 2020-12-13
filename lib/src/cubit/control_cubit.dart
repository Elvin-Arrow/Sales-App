import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sales_app/src/utilities/constants.dart';

part 'control_state.dart';

class ControlCubit extends Cubit<ControlState> {
  ControlCubit() : super(ControlInitial());

  String controlParameter;
  String dimensionParameter;

  void showControls(QueryControls controls) {
    switch (controls) {
      case QueryControls.Time:
        controlParameter = 'Time';
        _showTimeControls();
        break;

      case QueryControls.Location:
        controlParameter = 'Location';
        _showLocationControls();
        break;

      case QueryControls.Item:
        controlParameter = 'Item';
        _showItemControls();
        break;
      default:
    }
  }

  void _showTimeControls() {
    emit(TimeControl(controlParameter));
  }

  void _showLocationControls() {
    emit(LocationControl(controlParameter));
  }

  void _showItemControls() {
    emit(ItemControl(controlParameter));
  }
}
