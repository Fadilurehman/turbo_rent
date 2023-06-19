class DriverSignupModel {
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? profilePhoto;
  String? driverLicenceFront;
  String? drivingLicenceRear;
  String? sId;
  String? token;
  DriverSignupModel({
    this.name,
    this.driverLicenceFront,
    this.drivingLicenceRear,
    this.email,
    this.password,
    this.phoneNumber,
    this.profilePhoto,
    this.sId,
    this.token,
  });

  DriverSignupModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    profilePhoto = json['profilePhoto'];
    driverLicenceFront = json['driverLicenceFront'];
    drivingLicenceRear = json['drivingLicenceRear'];
    sId = json['_id'];
    token = json['token'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["email"] = email;
    data["phoneNumber"] = phoneNumber;
    data["password"] = password;
    data["driverLicenceFront"] = driverLicenceFront;
    data["drivingLicenceRear"] = drivingLicenceRear;
    data["profilePhoto"] = profilePhoto;
    return data;
  }
}
