import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sales_app/src/resources/sales_repository.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  final SalesRepository salesRepository;
  PageCubit(this.salesRepository) : super(PageInitial());

  void showDashboard() {
    emit(ShowDashboard());
  }

  void showOperations() {
    emit(ShowOperations());
  }
}
