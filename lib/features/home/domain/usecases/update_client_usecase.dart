import 'package:tost_test_code/features/home/data/models/client_model.dart';
import 'package:tost_test_code/features/home/domain/repository/home_repository.dart';

class UpdateClientUsecase {
  final HomeRepository repository;

  UpdateClientUsecase(this.repository);

  Future call(ClientModel client) async {
    return await repository.updateClient(client);
  }
}
