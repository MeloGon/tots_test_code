class UserEntity {
  final int id;
  final String email;
  final String tokenType;
  final String accessToken;

  UserEntity(
      {required this.id,
      required this.email,
      required this.tokenType,
      required this.accessToken});
}
