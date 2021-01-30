class User {
  int idUser;
  String username;
  String email;
  String roles;
  User({this.idUser, this.username, this.email, this.roles});
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
