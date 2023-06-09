import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) =>
    UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
  String? email;
  String? password;
  String? sId;
  String? fullName;
  String? phoneNumber;
  String? token;

  UserLoginModel({
    this.email,
    this.password,
    this.sId,
    this.fullName,
    this.phoneNumber,
    this.token,
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        fullName: json['fullName'],
        email: json['email'],
        sId: json['_id'],
        phoneNumber: json['phoneNumber'],
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
