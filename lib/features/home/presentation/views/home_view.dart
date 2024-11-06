import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:tost_test_code/core/extensions/space_extensions.dart';
import 'package:tost_test_code/features/home/presentation/view_model/home_viewmodel.dart';
import 'package:tost_test_code/features/home/presentation/views/home_view.form.dart';
import 'package:tost_test_code/features/home/presentation/widgets/popup_widget.dart';
import 'package:tost_test_code/ui/common/app_strings.dart';
import 'package:tost_test_code/widgets/background_widget.dart';
import 'package:tost_test_code/widgets/custom_button.dart';

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
          const BackgroundWidget(
            positionXFirst: -5,
            positionYFirst: -1.7,
            positionXSec: 3,
            positionXThird: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
            child: RefreshIndicator(
              onRefresh:viewModel.loadClients,
              child: SingleChildScrollView(
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
                    20.h,
                    const Align(
                        alignment: Alignment.centerLeft, child: Text(ksClients)),
                    20.h,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: TextFormField(
                            controller: searchInputController,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: ksSearch,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)))),
                          ),
                        ),
                        10.w,
                        CustomButton(
                          height: 50,
                          onPressed: viewModel.showAddClientForm,
                          text: ksAddnew,
                        )
                      ],
                    ),
                    20.h,
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(top: 0, bottom: 30),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final client = viewModel.clientsList?[index];
                        return Card.outlined(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: ListTile(
                            tileColor: Colors.white,
                            contentPadding:
                                const EdgeInsets.only(left: 16, right: 0),
                            title: Text(
                                '${client?.firstname ?? ''} ${client?.lastname ?? ''}'),
                            subtitle: Text(client?.email ?? ''),
                            leading: const CircleAvatar(),
                            trailing: PopupWidget(client!.id!),
                          ),
                        );
                      },
                      itemCount: viewModel.clientsListLength,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) =>
      HomeViewModel()..loadClients();
}
