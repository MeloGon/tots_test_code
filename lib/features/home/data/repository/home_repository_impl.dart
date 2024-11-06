import 'package:tost_test_code/features/home/data/datasource/home_datasource.dart';
import 'package:tost_test_code/features/home/data/models/client_model.dart';
import 'package:tost_test_code/features/home/domain/entities/client_entity.dart';
import 'package:tost_test_code/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});
  @override
  Future<List<ClientEntity>> getClients() async =>
      await homeDataSource.getClients();

  @override
  Future<ClientEntity> addClient(ClientModel client) async =>
      await homeDataSource.addClient(client);

  @override
  Future<ClientEntity> getClient(int clientId) async =>
      await homeDataSource.getClient(clientId);

  @override
  Future deleteClient(int clientId) async =>
      await homeDataSource.deleteClient(clientId);
}
