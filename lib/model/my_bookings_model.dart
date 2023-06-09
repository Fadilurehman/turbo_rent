import 'dart:convert';

List<MyBookingsModel> myBookingsModelListFromJson(String str) =>
    List<MyBookingsModel>.from(
        json.decode(str).map((x) => MyBookingsModel.fromJson(x)));

String myBookingsModelToJson(List<MyBookingsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyBookingsModel {
  String? sId;
  String? car;
  String? user;
  BookedSlots? bookedSlots;
  String? dropoffCity;
  String? totalAmount;
  String? totalHours;
  bool? driverRequire;
  String? transactionId;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<CarData>? carData;

  MyBookingsModel(
      {this.sId,
      this.car,
      this.user,
      this.bookedSlots,
      this.dropoffCity,
      this.totalAmount,
      this.totalHours,
      this.driverRequire,
      this.transactionId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.carData});

  MyBookingsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    car = json['car'];
    user = json['user'];
    bookedSlots = json['bookedSlots'] != null
        ? BookedSlots.fromJson(json['bookedSlots'])
        : null;
    dropoffCity = json['dropoffCity'];
    totalAmount = json['totalAmount'];
    totalHours = json['totalHours'];
    driverRequire = json['driverRequire'];
    transactionId = json['transactionId'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['carData'] != null) {
      carData = <CarData>[];
      json['carData'].forEach((v) {
        carData!.add(CarData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['car'] = car;
    data['user'] = user;
    if (bookedSlots != null) {
      data['bookedSlots'] = bookedSlots!.toJson();
    }
    data['dropoffCity'] = dropoffCity;
    data['totalAmount'] = totalAmount;
    data['totalHours'] = totalHours;
    data['driverRequire'] = driverRequire;
    data['transactionId'] = transactionId;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (carData != null) {
      data['carData'] = carData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookedSlots {
  String? from;
  String? to;

  BookedSlots({this.from, this.to});

  BookedSlots.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['from'] = from;
    data['to'] = to;
    return data;
  }
}

class CarData {
  String? sId;
  String? name;
  String? rent;
  String? body;
  String? place;
  String? model;
  String? transmission;
  String? fuel;
  String? brand;
  String? description;
  String? image;
  bool? isBlocked;
  List<BookedSlotss>? bookedSlots;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CarData(
      {this.sId,
      this.name,
      this.rent,
      this.body,
      this.place,
      this.model,
      this.transmission,
      this.fuel,
      this.brand,
      this.description,
      this.image,
      this.isBlocked,
      this.bookedSlots,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CarData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    rent = json['rent'];
    body = json['body'];
    place = json['place'];
    model = json['model'];
    transmission = json['transmission'];
    fuel = json['fuel'];
    brand = json['brand'];
    description = json['description'];
    image = json['image'];
    isBlocked = json['isBlocked'];
    if (json['bookedSlots'] != null) {
      bookedSlots = <BookedSlotss>[];
      json['bookedSlots'].forEach((v) {
        bookedSlots!.add(BookedSlotss.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['name'] = name;
    data['rent'] = rent;
    data['body'] = body;
    data['place'] = place;
    data['model'] = model;
    data['transmission'] = transmission;
    data['fuel'] = fuel;
    data['brand'] = brand;
    data['description'] = description;
    data['image'] = image;
    data['isBlocked'] = isBlocked;
    if (bookedSlots != null) {
      data['bookedSlots'] = bookedSlots!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class BookedSlotss {
  String? from;
  String? to;
  String? sId;

  BookedSlotss({from, to, sId});

  BookedSlotss.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['from'] = from;
    data['to'] = to;
    data['_id'] = sId;
    return data;
  }
}
