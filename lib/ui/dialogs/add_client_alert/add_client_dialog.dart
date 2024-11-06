import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:tost_test_code/core/extensions/space_extensions.dart';
import 'package:tost_test_code/features/home/data/models/client_model.dart';
import 'package:tost_test_code/features/home/presentation/view_model/home_viewmodel.dart';
import 'package:tost_test_code/ui/common/app_strings.dart';
import 'package:tost_test_code/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tost_test_code/ui/dialogs/add_client_alert/add_client_dialog.form.dart';

import 'package:tost_test_code/widgets/custom_button.dart';

@FormView(fields: [
  FormTextField(name: 'firstnameInput'),
  FormTextField(name: 'lastnameInput'),
  FormTextField(name: 'emailInput'),
])
class AddClientDialog extends StackedView<HomeViewModel> with $AddClientDialog {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AddClientDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.title!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      verticalSpaceTiny,
                      TextFormField(
                        controller: firstnameInputController,
                        decoration:
                            const InputDecoration(hintText: ksFirstname),
                      ),
                      20.h,
                      TextFormField(
                        controller: lastnameInputController,
                        decoration: const InputDecoration(hintText: ksLastname),
                      ),
                      20.h,
                      TextFormField(
                        controller: emailInputController,
                        decoration:
                            const InputDecoration(hintText: ksEmailAddress),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            50.h,
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: viewModel.goBack,
                    child: const Text(ksCancel),
                  ),
                ),
                10.w,
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      viewModel.addClient(
                        ClientModel(
                          firstname: firstnameInputController.text,
                          lastname: lastnameInputController.text,
                          email: emailInputController.text,
                        ),
                      );
                      completer.call(DialogResponse(confirmed: false));
                    },
                    text: ksSave,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}