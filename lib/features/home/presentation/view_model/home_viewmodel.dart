import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tost_test_code/app/app.dialogs.dart';
import 'package:tost_test_code/app/app.locator.dart';
import 'package:tost_test_code/features/home/data/models/client_model.dart';
import 'package:tost_test_code/features/home/domain/entities/client_entity.dart';
import 'package:tost_test_code/features/home/domain/usecases/add_client_usecase.dart';
import 'package:tost_test_code/features/home/domain/usecases/delete_client_usecase.dart';
import 'package:tost_test_code/features/home/domain/usecases/get_clients_usecase.dart';
import 'package:tost_test_code/ui/common/app_strings.dart';

class HomeViewModel extends BaseViewModel {
  final _getClientsUseCase = locator<GetClientsUsecase>();
  final _addClientUseCase = locator<AddClientUsecase>();
  final _deleteClientUseCase = locator<DeleteClientUsecase>();
  final _dialogService = locator<DialogService>();
  // ignore: prefer_final_fields
  List<ClientEntity>? _clientsList = [];
  List<ClientEntity>? get clientsList => _clientsList;
  int get clientsListLength => _clientsList?.length ?? 0;

  FutureOr loadClients() async {
    await _getClientsUseCase.call().then((response) {
      _clientsList?.clear();
      _clientsList?.addAll(response);
      notifyListeners();
    }).catchError((error) {});
  }

  FutureOr showAddClientForm() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.addClient,
      title: ksAddNewClient,
      description: 'Give stacked stars on Github',
    );
    if (response?.confirmed ?? false) {
      loadClients();
    }
  }

  FutureOr addClient(ClientModel client) async {
    await _addClientUseCase.call(client).then((response) {
      loadClients();
    }).catchError((error) {});
  }

  FutureOr deleteClient(int clientId) async {
    await _deleteClientUseCase.call(clientId).then((response) {
      if (response) {
        _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: ksClientDeletedSuccesful,
          description: ksClientDeletedSuccesful,
        );
        loadClients();
      }
    }).catchError((error) {});
  }
}
