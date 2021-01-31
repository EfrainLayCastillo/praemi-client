class User {
  int idUser;
  String username;
  String email;
  String roles;
  String tokenAuth;
  User({this.idUser, this.username, this.email, this.roles, this.tokenAuth});

  User.fromJson(Map<String, dynamic> json) {
    idUser = json['id'] as int;
    username = json['username'] as String;
    email = json['email'] as String;
    roles = json['role'] as String;
  }

}

class VerifyToken {
  String code;
  Data status;
  VerifyToken({this.code, this.status});
}

class Data {
  int status;
  Data({this.status});
}
