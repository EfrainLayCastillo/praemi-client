class User {
  int idUser;
  String username;
  String email;
  String roles;
  String tokenAuth;
  User({this.idUser, this.username, this.email, this.roles, this.tokenAuth});

  User.fromJson(Map<String, dynamic> json) {
    idUser = json['id'];
    username = json['username'];
    email = json['email'];
    roles = json['roles'][0];
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
