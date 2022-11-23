class UserModel {
  String user_id;
  String email;
  String password;

  UserModel(this.user_id, this.email, this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': user_id,
      'email': email,
      'password': password
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    user_id = map['user_id'];
    email = map['email'];
    password = map['password'];
  }
}
