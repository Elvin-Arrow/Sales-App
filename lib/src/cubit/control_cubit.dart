import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:sales_app/src/resources/sales_repository.dart';
import 'package:sales_app/src/utilities/constants.dart';

part 'control_state.dart';

class ControlCubit extends Cubit<ControlState> {
  final SalesRepository _salesRepository;

  ControlCubit(
    this._salesRepository,
  ) : super(ControlInitial());

  String controlParameter;
  Sale dimensionParameter;

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

  void setDimensionParameter(Sale saleType) {
    dimensionParameter = saleType;
    emit(
      ControlLoading(
        saleType,
        _salesRepository.getData(saleType),
      ),
    );
    // emit(ControlLoaded());
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
