import 'dart:convert';

List<PlaceDataModel> placeDataModelFromJson(String str) => List<PlaceDataModel>.from(json.decode(str).map((x) => PlaceDataModel.fromJson(x)));

String placeDataModelToJson(List<PlaceDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlaceDataModel {
    String? id;
    String? place;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    PlaceDataModel({
        this.id,
        this.place,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory PlaceDataModel.fromJson(Map<String, dynamic> json) => PlaceDataModel(
        id: json["_id"],
        place: json["place"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "place": place,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}