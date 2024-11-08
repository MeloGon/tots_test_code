import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:tost_test_code/core/extensions/space_extensions.dart';
import 'package:tost_test_code/features/login/data/models/login_req_params.dart';
import 'package:tost_test_code/features/login/presentation/view_model/login_viewmodel.dart';
import 'package:tost_test_code/features/login/presentation/views/login_view.form.dart';
import 'package:tost_test_code/ui/common/app_strings.dart';
import 'package:tost_test_code/widgets/background_widget.dart';
import 'package:tost_test_code/widgets/custom_button.dart';

@FormView(fields: [
  FormTextField(name: 'mailInput'),
  FormTextField(name: 'passwordInput')
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({super.key});

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  150.h,
                  const Text(
                    ksMinimal,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  60.h,
                  const Text(
                    ksLogin,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  30.h,
                  TextFormField(
                    controller: mailInputController,
                    decoration: const InputDecoration(hintText: ksMail),
                  ),
                  20.h,
                  TextFormField(
                    controller: passwordInputController,
                    decoration: const InputDecoration(hintText: ksPassword),
                    obscureText: true,
                  ),
                  60.h,
                  CustomButton(
                    onPressed: () => viewModel.login(LoginReqParams(
                        mail: mailInputController.text,
                        password: passwordInputController.text)),
                    text: ksLogin,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
