import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:tost_test_code/app/app.locator.dart';
import 'package:tost_test_code/features/home/domain/entities/client_entity.dart';
import 'package:tost_test_code/features/home/domain/usecases/get_clients_usecase.dart';

class HomeViewModel extends BaseViewModel {
  final _getClientsUseCase = locator<GetClientsUsecase>();
  List<ClientEntity>? _clientsList;
  List<ClientEntity>? get clientsList => _clientsList;
  int get clientsListLength => _clientsList?.length ?? 0;

  FutureOr loadClients() async {
    await _getClientsUseCase.call().then((response) {
      _clientsList = (_clientsList ?? [])..addAll(response);
      notifyListeners();
    }).catchError((error) {
      print('Error $error');
    });
  }
}
