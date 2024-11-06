import 'package:tost_test_code/features/home/domain/repository/home_repository.dart';

class DeleteClientUsecase {
  final HomeRepository repository;

  DeleteClientUsecase(this.repository);

  Future call(int clientId) async {
    return await repository.deleteClient(clientId);
  }
}
