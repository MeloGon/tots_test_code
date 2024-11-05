import 'package:tost_test_code/features/login/domain/entitties/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.id,
      required super.email,
      required super.tokenType,
      required super.accessToken});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: (json['id'] as num).toInt(),
        email: json['email'],
        tokenType: json['token_type'],
        accessToken: json['access_token']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'token_type': tokenType,
      'access_token': accessToken,
    };
  }
}
