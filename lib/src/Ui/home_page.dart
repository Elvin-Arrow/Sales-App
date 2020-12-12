import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_app/src/Ui/widgets/dashboard.dart';
import 'package:sales_app/src/Ui/widgets/operations.dart';
import 'package:sales_app/src/Ui/widgets/sidebar.dart';
import 'package:sales_app/src/cubit/page_cubit.dart';
import 'package:sales_app/src/utilities/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(24.0),
        child: Material(
          elevation: 2.0,
          borderRadius: BorderRadius.circular(12.0),
          child: _getContent(context),
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return Row(
      children: [
        // Side bar
        Sidebar(
          width: MediaQuery.of(context).size.width * 0.20,
          view: View.Dashboard,
        ),

        // Body
        BlocBuilder<PageCubit, PageState>(
          builder: (_, state) {
            if (state is PageLoading) {
              // TODO show loading page
            } else if (state is ShowOperations) {
              return Operations();
            }

            return Dashboard();
          },
        )
      ],
    );
  }
}
