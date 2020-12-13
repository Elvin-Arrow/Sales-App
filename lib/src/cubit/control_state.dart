part of 'control_cubit.dart';

@immutable
abstract class ControlState {}

class ControlInitial extends ControlState {}

class TimeControl extends ControlState {
  final String controlParameter;

  TimeControl(this.controlParameter);
}

class LocationControl extends ControlState {
  final String controlParameter;

  LocationControl(this.controlParameter);
}

class ItemControl extends ControlState {
  final String controlParameter;

  ItemControl(this.controlParameter);
}
