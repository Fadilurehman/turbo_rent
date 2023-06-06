import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbo_rent/model/user_otp_model.dart';
import 'package:turbo_rent/model/user_signup_model.dart';
import 'package:turbo_rent/res/api_services.dart';
import 'package:turbo_rent/res/api_status.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/urls.dart';
import 'package:turbo_rent/view/home_screen.dart';
import '../components/common/commonsnackbar.dart';
import '../view/authentication/otp_screen.dart';

class UserSignupViewModel with ChangeNotifier {
//  Controllers

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController1 = TextEditingController();

  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

// ****************

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isOtpLoading = false;
  bool get isOtpLoading => _isOtpLoading;

// ****************

  // UserSignUpModel? _userData;
  // UserSignUpModel get userData => _userData!;

  UserOtpModel? _userOtpData;
  UserOtpModel get userOtpData => _userOtpData!;

// ****************

  SignUpError? _signUpError;
  SignUpError get signUpError => _signUpError!;

  OtpError? _otpError;
  OtpError get otpError => _otpError!;

// ****************

  // Function to know it is loading signup
  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  // Function to know it is loading otp
  setLoadingOtp(bool loading) async {
    _isOtpLoading = loading;
    notifyListeners();
  }
// ****************

  Future<UserOtpModel?> setUserOtpData(UserOtpModel userOtpData) async {
    _userOtpData = userOtpData;
    return _userOtpData;
  }

// ****************

  setSignUpError(SignUpError signUpError, context) async {
    _signUpError = signUpError;
    return errorResponses(_signUpError!, context);
  }

  setOtpError(OtpError otpError, context) async {
    _otpError = otpError;
    return errorResponseOtp(_otpError!, context);
  }

// ****************
  getSignUpStatus(BuildContext context) async {
    final navigator = Navigator.of(context);
    setLoading(true);
    String url = Urls.baseUrl + Urls.user + Urls.userSignup;
    final response = await ApiServices.postMethod(
        url: url, data: userDataBody(), context: context);

    // Success
    if (response is Success) {
      log("SUCCCCCCCCCCCESSSSSSS");
      log("${response.response}");
      navigator.push(
        MaterialPageRoute(
          builder: (context) {
            return const UserOtpScreen();
          },
        ),
      );
    }
    // Failure
    if (response is Failures) {
      log("${response.code}");
      log("failedddddddddd");
      await setLoading(false);
      SignUpError signUpError = SignUpError(
        code: response.code,
        message: response.errrorResponse,
      );
      // ignore: use_build_context_synchronously
      await setSignUpError(signUpError, context);
    }
    setLoading(false);
  }

// OTP FUNCTION //
  getOtpStatus(BuildContext context) async {
    final navigator = Navigator.of(context);
    setLoadingOtp(true);
    String url = Urls.baseUrl + Urls.user + Urls.userOtp;
    final response = await ApiServices.postMethod(
      url: url,
      data: userOtpDataBody(context),
      context: context,
      function: userOtpModelFromJson,
    );

    // Success
    if (response is Success) {
      final data = await setUserOtpData(response.response as UserOtpModel);
      final accessToken = data!.token;
      final userId = data.sId;
      final userName = data.fullName;
      final userEmail = data.email;
      setSignupStatus(
          accessToken: accessToken!,
          userId: userId!,
          userName: userName!,
          userEmail: userEmail!);
      navigator.pushAndRemoveUntil(MaterialPageRoute(
        builder: (context) {
          return const HomeScreen();
        },
      ), (route) => false);
    }
    // Failure
    if (response is Failures) {
      await setLoadingOtp(false);
      OtpError otpError = OtpError(
        code: response.code,
        message: response.errrorResponse,
      );
      // ignore: use_build_context_synchronously
      await setOtpError(otpError, context);
    }

    setLoadingOtp(false);
  }

// *************
  // The body to pass in the method
  Map<String, dynamic> userDataBody() {
    final body = UserSignUpModel(
      fullName: nameController.text.trim(),
      email: emailController.text.trim(),
      phoneNumber: phoneNumberController.text.trim(),
      password: passwordController.text.trim(),
    );
    return body.toJson();
  }

  // The body to pass in the method Otp
  Map<String, dynamic> userOtpDataBody(context) {
    final body = UserOtpModel(
      otpCode: otpController1.text.trim(),
      fullName: nameController.text.trim(),
      email: emailController.text.trim(),
      phoneNumber: phoneNumberController.text.trim(),
      password: passwordController.text.trim(),
    );
    return body.toJson();
  }

  // save the value of access token and make sure the user already login or not
  setSignupStatus({
    required String accessToken,
    required String userId,
    required String userName,
    required String userEmail,
  }) async {
    final status = await SharedPreferences.getInstance();
    await status.setBool("isLoggedIn", true);
    await status.setString("ACCESS_TOKEN", accessToken);
    await status.setString("USER_ID", userId);
    await status.setString("USER_NAME", userName);
    await status.setString("USER_EMAIL", userEmail);
  }

  clearControllers(context) {
    otpController1.clear();
    nameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
  }

  otpButton(context) async {
    await getOtpStatus(context);
    clearControllers(context);
  }

// *************

  // Error  Responses Signup
  errorResponses(SignUpError signUpError, BuildContext context) {
    final statusCode = signUpError.code;
    if (statusCode == 400 || statusCode == 500) {
      return CommonSnackBAr.snackBar(
        context: context,
        data: "User Already Exists",
        color: snackbarRed,
      );
    } else if (statusCode == 103) {
      log("Aryooooooola");
    }

    return CommonSnackBAr.snackBar(
      context: context,
      data: "No Internet connection",
      color: snackbarRed,
    );
  }

  // Error  Responses Otp
  errorResponseOtp(OtpError otpError, BuildContext context) {
    final statusCode = otpError.code;
    if (statusCode == 400 || statusCode == 408) {
      return CommonSnackBAr.snackBar(
        context: context,
        data: "Invalid Otp",
        color: snackbarRed,
      );
    }
    return CommonSnackBAr.snackBar(
      context: context,
      data: "No Internet connection",
      color: snackbarRed,
    );
  }
}

class SignUpError {
  int? code;
  Object? message;

  SignUpError({
    this.code,
    this.message,
  });
}

class OtpError {
  int? code;
  Object? message;

  OtpError({
    this.code,
    this.message,
  });
}
