import 'dart:convert';

UserOtpModel userOtpModelFromJson(String str) =>
    UserOtpModel.fromJson(json.decode(str));

class UserOtpModel {
  String? email;
  String? password;
  String? sId;
  String? fullName;
  String? phoneNumber;
  String? token;
  String? otpCode;

  UserOtpModel({
    this.email,
    this.password,
    this.sId,
    this.fullName,
    this.phoneNumber,
    this.token,
    this.otpCode,
  });

  factory UserOtpModel.fromJson(Map<String, dynamic> json) => UserOtpModel(
        email: json['email'],
        sId: json['_id'],
        fullName: json['fullName'],
        phoneNumber: json['phoneNumber'],
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        'email': email,
        "phoneNumber": phoneNumber,
        'password': password,
        'otpCode': otpCode,
      };
}
