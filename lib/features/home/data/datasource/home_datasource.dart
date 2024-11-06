import 'package:shared_preferences/shared_preferences.dart';
import 'package:tost_test_code/config/network/network_client.dart';
import 'package:tost_test_code/features/home/data/models/client_added_resp.dart';
import 'package:tost_test_code/features/home/data/models/client_model.dart';
import 'package:tost_test_code/features/home/domain/entities/client_entity.dart';

abstract class HomeDataSource {
  Future<List<ClientEntity>> getClients();
  Future<ClientAddedResp> addClient(ClientModel client);
  Future<ClientEntity> getClient(int clientId);
  Future deleteClient(int clientId);
  Future updateClient(ClientModel client);
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

  @override
  Future<ClientAddedResp> addClient(ClientModel client) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await dio.post(
          url:
              'https://myback-execute-dot-my-back-401316.uc.r.appspot.com/6-tots-test/clients',
          token: prefs.getString('token'),
          formData: {
            'firstname': client.firstname,
            'lastname': client.lastname,
            'email': client.email,
            'address': client.address,
            'photo': client.photo,
            'caption': client.caption,
          });
      return ClientAddedResp.fromJson(response);
    } catch (e) {
      throw Exception('Something was wrong ... $e');
    }
  }

  @override
  Future<ClientModel> getClient(int clientId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await dio.get(
        url:
            'https://myback-execute-dot-my-back-401316.uc.r.appspot.com/6-tots-test/clients/$clientId',
        token: prefs.getString('token'),
      );
      return ClientModel.fromJson(response);
    } catch (e) {
      throw Exception('Something was wrong ... $e');
    }
  }

  @override
  Future<bool> deleteClient(int clientId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await dio.delete(
        url:
            'https://myback-execute-dot-my-back-401316.uc.r.appspot.com/6-tots-test/clients/$clientId',
        token: prefs.getString('token'),
      );
      return response['success'];
    } catch (e) {
      throw Exception('Something was wrong ... $e');
    }
  }

  @override
  Future updateClient(ClientModel client) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await dio.post(
          url:
              'https://myback-execute-dot-my-back-401316.uc.r.appspot.com/6-tots-test/clients/${client.id}',
          token: prefs.getString('token'),
          formData: {
            'firstname': client.firstname,
            'lastname': client.lastname,
            'email': client.email,
          });
    } catch (e) {
      throw Exception('Something was wrong ... $e');
    }
  }
}
