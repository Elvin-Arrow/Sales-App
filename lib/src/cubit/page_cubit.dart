import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sales_app/src/resources/models/yearl_sales.dart';
import 'package:sales_app/src/resources/sales_repository.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  final SalesRepository _salesRepository;
  PageCubit(this._salesRepository) : super(PageInitial());

  List<YearlySales> yearlySales;

  void showDashboard() async {
    if (yearlySales == null) {
      yearlySales = await _salesRepository.getYearlySales();
    }

    emit(ShowDashboard(yearlySales));
  }

  void showOperations() {
    emit(ShowOperations());
  }
}
