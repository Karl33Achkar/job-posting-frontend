import 'dart:convert';

class User {
  late final String? name;
  late final String email;
  late final String password;
  //final String? newPassword;

  User({
    this.name,
    required this.email,
    required this.password,
    //this.newPassword
  });

  Map<String,dynamic> ToMap(){
    return {
      'name':name,
      'email':email,
      'password':password,
      //'newPassword': newPassword
    };
  }
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String?,
      email: map['email'] as String,
      password: map['password'] as String,
      //newPassword: map['newPassword'] as String?
    );
  }
  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  // Convert User object to JSON string
  String toJson() => json.encode(ToMap());

}