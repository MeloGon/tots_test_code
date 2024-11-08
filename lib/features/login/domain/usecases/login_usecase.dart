import 'package:tost_test_code/features/login/data/models/login_req_params.dart';
import 'package:tost_test_code/features/login/domain/entitties/user_entity.dart';
import 'package:tost_test_code/features/login/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<UserEntity> call(LoginReqParams loginReq) async {
    return await repository.login(loginReq);
  }
}
