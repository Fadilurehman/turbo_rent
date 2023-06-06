// To parse this JSON data, do
//
//     final userSignUpModel = userSignUpModelFromJson(jsonString);

import 'dart:convert';

UserSignUpModel userSignUpModelFromJson(String str) =>
    UserSignUpModel.fromJson(json.decode(str));

String userSignUpModelToJson(UserSignUpModel data) =>
    json.encode(data.toJson());

class UserSignUpModel {
  String fullName;
  String email;
  String phoneNumber;
  String password;

  UserSignUpModel({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) =>
      UserSignUpModel(
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
      };
}
