import 'package:tost_test_code/features/login/data/models/login_req_params.dart';
import 'package:tost_test_code/features/login/domain/entitties/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(LoginReqParams loginReq);
}
