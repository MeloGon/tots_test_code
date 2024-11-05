import 'package:shared_preferences/shared_preferences.dart';
import 'package:tost_test_code/config/network/network_client.dart';
import 'package:tost_test_code/features/home/data/models/client_model.dart';
import 'package:tost_test_code/features/home/domain/entities/client_entity.dart';

abstract class HomeDataSource {
  Future<List<ClientEntity>> getClients();
}

class HomeDataSourceImpl extends HomeDataSource {
  final NetworkUtil dio;

  HomeDataSourceImpl(this.dio);
  @override
  Future<List<ClientModel>> getClients() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await dio.get(
          url:
              'https://myback-execute-dot-my-back-401316.uc.r.appspot.com/6-tots-test/clients',
          token: prefs.getString('token'));
      return List<Map<String, dynamic>>.from(response['data'])
          .map((e) => ClientModel.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception('Something was wrong ... $e');
    }
  }
}
