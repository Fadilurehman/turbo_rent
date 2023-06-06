import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) =>
    UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? token;

  UserLoginModel({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.token,
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "token": token,
      };
}
