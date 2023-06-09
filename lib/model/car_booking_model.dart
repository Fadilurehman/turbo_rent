
import 'dart:convert';

BookCarDataModel bookCarDataModelFromJson(String str) => BookCarDataModel.fromJson(json.decode(str));

String bookCarDataModelToJson(BookCarDataModel data) => json.encode(data.toJson());

class BookCarDataModel {
    String? user;
    String? car;
    String? totalAmount;
    String? totalDays;
    String? pickUpDate;
    String? dropOffDate;
    String? dropOffCity;
    String? driverRequire;

    BookCarDataModel({
        this.user,
        this.car,
        this.totalAmount,
        this.totalDays,
        this.pickUpDate,
        this.dropOffDate,
        this.dropOffCity,
        this.driverRequire,
    });

    factory BookCarDataModel.fromJson(Map<String, dynamic> json) => BookCarDataModel(
        user: json["user"],
        car: json["car"],
        totalAmount: json["totalAmount"],
        totalDays: json["totalDays"],
        pickUpDate: json["pickUpDate"],
        dropOffDate: json["dropOffDate"],
        dropOffCity: json["dropOffCity"],
        driverRequire: json["driverRequire"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "car": car,
        "totalAmount": totalAmount,
        "totalDays": totalDays,
        "pickUpDate": pickUpDate,
        "dropOffDate": dropOffDate,
        "dropOffCity": dropOffCity,
        "driverRequire": driverRequire,
    };
}
