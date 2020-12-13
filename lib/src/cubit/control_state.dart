part of 'control_cubit.dart';

@immutable
abstract class ControlState {}

class ControlInitial extends ControlState {}

class TimeControl extends ControlState {}

class LocationControl extends ControlState {}

class ItemControl extends ControlState {}
