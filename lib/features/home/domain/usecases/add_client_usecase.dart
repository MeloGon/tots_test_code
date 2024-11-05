import 'package:tost_test_code/features/home/data/models/client_model.dart';
import 'package:tost_test_code/features/home/domain/entities/client_entity.dart';
import 'package:tost_test_code/features/home/domain/repository/home_repository.dart';

class AddClientUsecase {
  final HomeRepository repository;

  AddClientUsecase(this.repository);

  Future<ClientEntity> call(ClientModel client) async {
    return await repository.addClient(client);
  }
}
