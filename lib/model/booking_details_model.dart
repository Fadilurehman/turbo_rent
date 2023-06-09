// To parse this JSON data, do
//
//     final bookingDetails = bookingDetailsFromJson(jsonString);

import 'dart:convert';

BookingDetails bookingDetailsFromJson(String str) => BookingDetails.fromJson(json.decode(str));

String bookingDetailsToJson(BookingDetails data) => json.encode(data.toJson());

class BookingDetails {
    String? car;
    String? user;
    BookedSlots? bookedSlots;
    String? dropoffCity;
    String? totalAmount;
    String? totalHours;
    bool? driverRequire;
    String? transactionId;
    String? status;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    BookingDetails({
        this.car,
        this.user,
        this.bookedSlots,
        this.dropoffCity,
        this.totalAmount,
        this.totalHours,
        this.driverRequire,
        this.transactionId,
        this.status,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory BookingDetails.fromJson(Map<String, dynamic> json) => BookingDetails(
        car: json["car"],
        user: json["user"],
        bookedSlots: json["bookedSlots"] == null ? null : BookedSlots.fromJson(json["bookedSlots"]),
        dropoffCity: json["dropoffCity"],
        totalAmount: json["totalAmount"],
        totalHours: json["totalHours"],
        driverRequire: json["driverRequire"],
        transactionId: json["transactionId"],
        status: json["status"],
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "car": car,
        "user": user,
        "bookedSlots": bookedSlots?.toJson(),
        "dropoffCity": dropoffCity,
        "totalAmount": totalAmount,
        "totalHours": totalHours,
        "driverRequire": driverRequire,
        "transactionId": transactionId,
        "status": status,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class BookedSlots {
    DateTime? from;
    DateTime? to;

    BookedSlots({
        this.from,
        this.to,
    });

    factory BookedSlots.fromJson(Map<String, dynamic> json) => BookedSlots(
        from: json["from"] == null ? null : DateTime.parse(json["from"]),
        to: json["to"] == null ? null : DateTime.parse(json["to"]),
    );

    Map<String, dynamic> toJson() => {
        "from": from?.toIso8601String(),
        "to": to?.toIso8601String(),
    };
}
