import 'dart:developer';
import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbo_rent/components/common/commonsnackbar.dart';
import 'package:turbo_rent/model/driver_login_model.dart';
import 'package:turbo_rent/res/api_services.dart';
import 'package:turbo_rent/res/api_status.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/urls.dart';
import 'package:turbo_rent/view/driver_screen.dart';
import 'package:turbo_rent/view/home_screen.dart';
import 'package:turbo_rent/view_model/login_view_model.dart';

class DriverViewModel with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController loginEmailcntrlr = TextEditingController();
  TextEditingController loginPswrdcntrlr = TextEditingController();

  String? driverImgURL;

  String? license1URL;

  String? license2URL;

  String? _driverName;
  String? get driverName => _driverName;

  String? _driverEmail;
  String? get driverEmail => _driverEmail;

  DriverLoginModel? _driverData;
  DriverLoginModel get driverData => _driverData!;

  Color _dpColor = kwhite;
  Color get dpColor => _dpColor;

  Color _licnsImg1 = kwhite;
  Color get licnsImg1 => _licnsImg1;

  Color _licnsImg2 = kwhite;
  Color get licnsImg2 => _licnsImg2;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  File? _driverImage;
  File? get driverImage => _driverImage;

  File? _licenseFrontView;
  File? get licenseFrontView => _licenseFrontView;

  File? _licenseRearView;
  File? get licenseRearView => _licenseRearView;

  LoginError? _loginError;
  LoginError? get loginError => _loginError;

  final cloudinary = Cloudinary.signedConfig(
      cloudName: 'dwpy32doq',
      apiKey: '219862858363568',
      apiSecret: 'tyUqItUenRyJBXtKxEvuBeDKAQc');

  Future<DriverLoginModel?> setDriverData(DriverLoginModel driverData) async {
    _driverData = driverData;
    return _driverData;
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setDpError(Color clr) {
    _dpColor = clr;
    notifyListeners();
  }

  setLcnsImg1(Color clr) {
    _licnsImg1 = clr;
    notifyListeners();
  }

  setLcnsImg2(Color clr) {
    _licnsImg2 = clr;
    notifyListeners();
  }

  setImage(File? driverImg) {
    _driverImage = driverImg;
    notifyListeners();
  }

  setImage2(File? licnsFront) {
    _licenseFrontView = licnsFront;
    notifyListeners();
  }

  setImage3(File? licnseRear) {
    _licenseRearView = licnseRear;
    notifyListeners();
  }

  setLoginError(LoginError loginError, context) async {
    _loginError = loginError;
    return errorResponses(_loginError!, context);
  }

  pickImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    File? driverProfile;
    if (img != null) {
      driverProfile = File(img.path);
      setImage(driverProfile);
      CloudinaryResponse response = await cloudinary.upload(
        file: driverProfile.path,
        fileBytes: driverProfile.readAsBytesSync(),
        resourceType: CloudinaryResourceType.image,
      );
      if (response.isSuccessful) {
        log("image cloudianryil ethi");
        log(response.secureUrl.toString());
        driverImgURL = response.secureUrl.toString();
        log(driverImgURL.toString());
      }
    } else {
      // setBorderError(
      //   Border.all(color: Colors.red, width: 2),
      // );
    }
  }

  picklicense1() async {
    final license1 = await ImagePicker().pickImage(source: ImageSource.gallery);
    File? licenseFront;
    if (license1 != null) {
      licenseFront = File(license1.path);
      setImage2(licenseFront);
      CloudinaryResponse response = await cloudinary.upload(
        file: licenseFront.path,
        fileBytes: licenseFront.readAsBytesSync(),
        resourceType: CloudinaryResourceType.image,
      );
      if (response.isSuccessful) {
        log("image 2 cloudianryil ethi");
        log(response.secureUrl.toString());
        license1URL = response.secureUrl.toString();
        log(license1URL.toString());
      }
    }
  }

  picklicense2() async {
    final license2 = await ImagePicker().pickImage(source: ImageSource.gallery);
    File? licenseRear;
    if (license2 != null) {
      licenseRear = File(license2.path);
      setImage3(licenseRear);
      CloudinaryResponse response = await cloudinary.upload(
        file: licenseRear.path,
        fileBytes: licenseRear.readAsBytesSync(),
        resourceType: CloudinaryResourceType.image,
      );
      if (response.isSuccessful) {
        log("image 3 cloudianryil ethi");
        log(response.secureUrl.toString());
        license2URL = response.secureUrl.toString();
        log(license2URL.toString());
      }
    }
  }

  driverSignupService(context) async {
    final navigator = Navigator.of(context);
    setLoading(true);
    String url = Urls.baseUrl + Urls.driver + Urls.driverSignUp;
    final body = {
      "name": nameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "phoneNumber": phoneNumberController.text.trim(),
      "profilePhoto": driverImgURL,
      "driverLicenceFront": license1URL,
      "drivingLicenceRear": license2URL,
    };
    final response =
        await ApiServices.postMethod(url: url, data: body, context: context);
    if (response is Success) {
      navigator.push(
        MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ),
      );
      CommonSnackBAr.snackBar(
        context: context,
        data:
            "succesfully created \nYour Account is Waiting for our Administrator approval, Please  check back later",
        color: specialGreen,
      );
      clearController();
    }
    if (response is Failures) {
      setLoading(false);

      CommonSnackBAr.snackBar(
        context: context,
        data: response.responseMsg.toString(),
        color: snackbarRed,
      );
    }
  }

  driverLoginService(context) async {
    final navigator = Navigator.of(context);
    setLoading(true);
    String url = Urls.baseUrl + Urls.driver + Urls.driverLogIn;
    final body = {
      "email": loginEmailcntrlr.text.trim(),
      "password": loginPswrdcntrlr.text.trim(),
    };
    final response = await ApiServices.postMethod(
      context: context,
      url: url,
      data: body,
      function: driverLoginModelFromJson,
    );
    if (response is Success) {
      final data = await setDriverData(response.response as DriverLoginModel);
      final driverName = data!.name;
      final driverEmail = data.email;
      setDriverStatus(driverName: driverName!, driverEmail: driverEmail!);
      clearController();
      navigator.pushAndRemoveUntil(MaterialPageRoute(
        builder: (context) {
          return const DriverScreen();
        },
      ), (route) => false);
    }
    if (response is Failures) {
      log("^^^^^^^^^${response.code}^^^^^^^^");
      setLoading(false);
      // setLoginError(loginError!, context);
      if (response.code == 500) {
        CommonSnackBAr.snackBar(
          context: context,
          data: "Your Account is Waiting for our Administrator approval",
          color: snackbarRed,
        );
      }
    }
    setLoading(false);
  }

  setDriverStatus({
    required String driverName,
    required String driverEmail,
  }) async {
    final status = await SharedPreferences.getInstance();

    await status.setString("DRIVER_NAME", driverName);
    await status.setString("DRIVER_EMAIL", driverEmail);
  }

  getDriverDetails() async {
    final prefs = await SharedPreferences.getInstance();
    _driverName = prefs.getString("DRIVER_NAME");
    _driverEmail = prefs.getString("DRIVER_EMAIL");
    notifyListeners();
  }

  clearController() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneNumberController.clear();
    loginEmailcntrlr.clear();
    loginPswrdcntrlr.clear();
    _driverImage = null;
    _licenseFrontView = null;
    _licenseRearView = null;
    driverImgURL = null;
    license1URL = null;
    license2URL = null;
  }

  errorResponses(LoginError loginError, BuildContext context) {
    final statusCode = loginError.code;
    if (statusCode == 400 || statusCode == 500) {
      return CommonSnackBAr.snackBar(
          context: context,
          data: "Invalid Username or password",
          color: snackbarRed);
    }
    return CommonSnackBAr.snackBar(
        context: context, data: "No internet connection", color: snackbarRed);
  }
}
