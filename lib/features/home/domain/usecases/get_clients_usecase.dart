import 'package:tost_test_code/features/home/domain/entities/client_entity.dart';
import 'package:tost_test_code/features/home/domain/repository/home_repository.dart';

class GetClientsUsecase {
  final HomeRepository repository;

  GetClientsUsecase(this.repository);

  Future<List<ClientEntity>> call() async {
    return await repository.getClients();
  }
}
