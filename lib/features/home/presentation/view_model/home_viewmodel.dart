import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tost_test_code/app/app.dialogs.dart';
import 'package:tost_test_code/app/app.locator.dart';
import 'package:tost_test_code/core/enums/popup_action_enum.dart';
import 'package:tost_test_code/features/home/data/models/client_model.dart';
import 'package:tost_test_code/features/home/domain/entities/client_entity.dart';
import 'package:tost_test_code/features/home/domain/usecases/add_client_usecase.dart';
import 'package:tost_test_code/features/home/domain/usecases/delete_client_usecase.dart';
import 'package:tost_test_code/features/home/domain/usecases/get_client_usecase.dart';
import 'package:tost_test_code/features/home/domain/usecases/get_clients_usecase.dart';
import 'package:tost_test_code/features/home/domain/usecases/update_client_usecase.dart';
import 'package:tost_test_code/ui/common/app_strings.dart';
import 'package:tost_test_code/ui/dialogs/add_client_alert/add_client_dialog.form.dart';

class HomeViewModel extends BaseViewModel with $AddClientDialog {
  final _getClientsUseCase = locator<GetClientsUsecase>();
  final _getClientUseCase = locator<GetClientUsecase>();
  final _addClientUseCase = locator<AddClientUsecase>();
  final _deleteClientUseCase = locator<DeleteClientUsecase>();
  final _updateClientUseCase = locator<UpdateClientUsecase>();

  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  // ignore: prefer_final_fields
  List<ClientEntity>? _clientsList = [];

  List<ClientEntity>? get clientsList => _clientsList;

  int get clientsListLength => _clientsList?.length ?? 0;
  PopupActionEnum? _clientAction;

  PopupActionEnum? get clientAction => _clientAction;

  Future<void> loadClients() async {
    await _getClientsUseCase.call().then((response) {
      _clientsList?.clear();
      _clientsList?.addAll(response);
      notifyListeners();
    }).catchError((error) {});
  }

  FutureOr showAddClientForm({ClientEntity? clientForEdit}) async {
    if (_clientAction == PopupActionEnum.edit) {
      var response = await _dialogService.showCustomDialog(
        variant: DialogType.addClient,
        title: ksEditClient,
      );
      if (response?.confirmed ?? false) {
        updateClientData(ClientModel(
            id: clientForEdit?.id,
            firstname: firstnameInputController.text,
            lastname: lastnameInputController.text,
            email: emailInputController.text));
        loadClients();
      }
      _clientAction = null;
    } else {
      clearInputs();
      var response = await _dialogService.showCustomDialog(
        variant: DialogType.addClient,
        title: ksAddNewClient,
      );
      if (response?.confirmed ?? false) {
        addClient(
          ClientModel(
            firstname: firstnameInputController.text,
            lastname: lastnameInputController.text,
            email: emailInputController.text,
          ),
        );
        loadClients();
      }
    }
  }

  FutureOr addClient(ClientModel client) async {
    await _addClientUseCase.call(client).then((response) {
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: ksClientAdded,
        description: '$ksClientAddedSuccessful  id : $response',
      );
      loadClients();
    }).catchError((error) {});
  }

  FutureOr deleteClient(int clientId) async {
    await _deleteClientUseCase.call(clientId).then((response) {
      if (response) {
        _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: ksClientDeletedSuccessful,
          description: ksClientDeletedSuccessful,
        );
        loadClients();
      }
    }).catchError((error) {});
  }

  FutureOr goBack() => _navigationService.back();

  FutureOr getClient(int clientId) async {
    await _getClientUseCase.call(clientId).then((response) async {
      firstnameInputController.text = response.firstname ?? '';
      lastnameInputController.text = response.lastname ?? '';
      emailInputController.text = response.email ?? '';
      showAddClientForm(clientForEdit: response);
    }).catchError((error) {});
  }

  FutureOr updateClientData(ClientModel client) async {
    await _updateClientUseCase.call(client).then((response) async {
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: ksClientUpdated,
        description: ksClientUpdatedSuccessful,
      );

    }).catchError((error) {});
  }

  void onActionSelected(PopupActionEnum action, int clientId) {
    switch (action) {
      case PopupActionEnum.eliminate:
        _clientAction = PopupActionEnum.eliminate;
        deleteClient(clientId);
        break;
      case PopupActionEnum.edit:
        _clientAction = PopupActionEnum.edit;
        getClient(clientId);
        break;
    }
    notifyListeners();
  }

  void clearInputs() {
    firstnameInputController.clear();
    lastnameInputController.clear();
    emailInputController.clear();
  }
}
