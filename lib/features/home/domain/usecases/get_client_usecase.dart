import 'package:tost_test_code/features/home/domain/entities/client_entity.dart';
import 'package:tost_test_code/features/home/domain/repository/home_repository.dart';

class GetClientUsecase {
  final HomeRepository repository;

  GetClientUsecase(this.repository);

  Future<ClientEntity> call(int clientId) async =>
      await repository.getClient(clientId);
}
