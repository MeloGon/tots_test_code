import 'package:tost_test_code/features/home/domain/entities/client_entity.dart';

abstract class HomeRepository {
  Future<List<ClientEntity>> getClients();
}
