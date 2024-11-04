import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tost_test_code/features/login/ui/view_model/login_viewmodel.dart';
import 'package:tost_test_code/ui/common/app_colors.dart';
import 'package:tost_test_code/widgets/background_widget.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(),
          SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'minimal',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'LOG IN',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
