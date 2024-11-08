import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tost_test_code/core/enums/popup_action_enum.dart';
import 'package:tost_test_code/features/home/presentation/view_model/home_viewmodel.dart';
import 'package:tost_test_code/ui/common/app_strings.dart';

class PopupWidget extends ViewModelWidget<HomeViewModel> {
  final int clientId;

  const PopupWidget(this.clientId);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return PopupMenuButton<PopupActionEnum>(
      color: Colors.black,
      initialValue: viewModel.clientAction,
      onSelected: (value) => viewModel.onActionSelected(value, clientId),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<PopupActionEnum>>[
        const PopupMenuItem<PopupActionEnum>(
          value: PopupActionEnum.eliminate,
          child: Text(
            ksEliminate,
            style: TextStyle(color: Colors.white),
          ),
        ),
        const PopupMenuItem<PopupActionEnum>(
          value: PopupActionEnum.edit,
          child: Text(
            ksEdit,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
