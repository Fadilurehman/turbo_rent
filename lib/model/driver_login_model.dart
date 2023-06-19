
import 'dart:convert';

DriverLoginModel driverLoginModelFromJson(String str) => DriverLoginModel.fromJson(json.decode(str));

String driverLoginModelToJson(DriverLoginModel data) => json.encode(data.toJson());

class DriverLoginModel {
    String? id;
    String? name;
    String? email;
    String? phoneNumber;
    String? token;

    DriverLoginModel({
        this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.token,
    });

    factory DriverLoginModel.fromJson(Map<String, dynamic> json) => DriverLoginModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "token": token,
    };
}
