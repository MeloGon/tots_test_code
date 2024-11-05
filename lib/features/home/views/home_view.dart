import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:tost_test_code/features/home/view_model/home_viewmodel.dart';
import 'package:tost_test_code/features/home/views/home_view.form.dart';
import 'package:tost_test_code/ui/common/app_strings.dart';
import 'package:tost_test_code/widgets/background_widget.dart';

@FormView(fields: [
  FormTextField(name: 'searchInput'),
])
class HomeView extends StackedView<HomeViewModel> with $HomeView {
  const HomeView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  ksMinimal,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text('Clients')
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
