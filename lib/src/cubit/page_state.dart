part of 'page_cubit.dart';

@immutable
abstract class PageState {}

class PageInitial extends PageState {}

class PageLoading extends PageState {}

class ShowDashboard extends PageState {}

class ShowOperations extends PageState {}
