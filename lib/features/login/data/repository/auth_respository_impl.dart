import 'package:tost_test_code/features/login/data/datasource/auth_datasource.dart';
import 'package:tost_test_code/features/login/data/models/login_req_params.dart';
import 'package:tost_test_code/features/login/domain/entitties/user_entity.dart';
import 'package:tost_test_code/features/login/domain/repository/auth_repository.dart';

class AuthRespositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRespositoryImpl({required this.authDataSource});
  @override
  Future<UserEntity> login(LoginReqParams loginReq) async {
    return await authDataSource.login(loginReq);
  }
}
