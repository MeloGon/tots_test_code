import 'package:tost_test_code/features/home/data/datasource/home_datasource.dart';
import 'package:tost_test_code/features/home/domain/entities/client_entity.dart';
import 'package:tost_test_code/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});
  @override
  Future<List<ClientEntity>> getClients() async {
    return await homeDataSource.getClients();
  }
}
