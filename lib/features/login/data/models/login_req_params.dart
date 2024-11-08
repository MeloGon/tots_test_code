class LoginReqParams {
  final String mail;
  final String password;

  LoginReqParams({required this.mail, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': mail,
      'password': password,
    };
  }
}
