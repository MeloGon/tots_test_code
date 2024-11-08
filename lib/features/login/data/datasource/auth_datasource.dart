import 'package:tost_test_code/config/network/network_client.dart';
import 'package:tost_test_code/features/login/data/models/login_req_params.dart';
import 'package:tost_test_code/features/login/data/models/user_model.dart';
import 'package:tost_test_code/features/login/domain/entitties/user_entity.dart';

abstract class AuthDataSource {
  Future<UserEntity> login(LoginReqParams loginReq);
}

class AuthDataSourceImpl extends AuthDataSource {
  final NetworkUtil dio;

  AuthDataSourceImpl(this.dio);
  @override
  Future<UserModel> login(LoginReqParams loginReq) async {
    try {
      final response = await dio.post(
          url:
              'https://myback-execute-dot-my-back-401316.uc.r.appspot.com/6-tots-test/oauth/token',
          formData: {
            'email': loginReq.mail,
            'password': loginReq.password,
          });
      return UserModel.fromJson(response);
    } catch (e) {
      throw Exception('Something was wrong ...');
    }
  }
}
