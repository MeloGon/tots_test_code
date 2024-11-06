import 'package:tost_test_code/features/home/data/models/client_model.dart';
import 'package:tost_test_code/features/home/domain/entities/client_entity.dart';

abstract class HomeRepository {
  Future<List<ClientEntity>> getClients();

  Future<ClientEntity> addClient(ClientModel client);

  Future<ClientEntity> getClient(int clientId);

  Future deleteClient(int clientId);
}
