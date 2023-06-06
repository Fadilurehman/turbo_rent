import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbo_rent/components/common/commonsnackbar.dart';
import 'package:turbo_rent/model/user_login_model.dart';
import 'package:turbo_rent/res/api_services.dart';
import 'package:turbo_rent/res/api_status.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/urls.dart';
import 'package:turbo_rent/view/home_screen.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordCntrlr = TextEditingController();

  String? _userName;
  String? get userName => _userName;

  String? _userEmail;
  String? get userEmail => _userEmail;

  Error? _loginError;
  Error? get loginError => _loginError;

  bool _passwordVisibility = true;
  bool get passwordVisibility => _passwordVisibility;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserLoginModel? _userData;
  UserLoginModel? get userData => _userData;

  Future<UserLoginModel?> setUserData(UserLoginModel userData) async {
    _userData = userData;
    return _userData;
  }

  getUserName(String? userName) {
    _userName = userName;
    notifyListeners();
  }

  getUserEmail(String? usrEmail) {
    _userEmail = usrEmail;
    notifyListeners();
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  showPassword() {
    _passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  getLoginStatus(context) async {
    setLoading(true);

    String url = Urls.baseUrl + Urls.user + Urls.userLogin;
    Map<dynamic, dynamic> body = {
      "email": emailController.text.trim(),
      "password": passwordCntrlr.text.trim()
    };
    final response = await ApiServices.postMethod(
        url: url,
        data: body,
        context: context,
        function: userLoginModelFromJson);
    if (response is Success) {
      log("11111111");
      final data = await setUserData(response.response as UserLoginModel);
      final accessToken = data!.token;
      final userId = data.id;
      final userName = data.fullName;
      final userEmail = data.email;
      setLoginStatus(
          accessToken: accessToken!,
          userId: userId!,
          userName: userName!,
          userEmail: userEmail!);
      clearController();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
    }
    if (response is Failures) {
      setLoading(false);
      Error loginError =
          Error(code: response.code, message: response.responseMsg);
      setLoginError(loginError, context);
      log("failed");
    }
    setLoading(false);
  }

  // save the value of access token and make sure the user already login or not
  // and also sacing user id
  setLoginStatus({
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

  getUserDetails() async {
    final pref = await SharedPreferences.getInstance();
    final name = pref.getString("USER_NAME");
    final email = pref.getString("USER_EMAIL");
    getUserName(name);
    getUserEmail(email);
  }

  void clearController() {
    emailController.clear();
    passwordCntrlr.clear();
  }

  setLoginError(Error? error, context) async {
    _loginError = error;
    return errorResponses(loginError!, context);
  }

  errorResponses(Error loginError, BuildContext context) {
    final statusCode = loginError.code;
    if (statusCode == 401 || statusCode == 500) {
      log("snackbar: Invalid username or passeord");
      return CommonSnackBAr.snackBar(
          context: context,
          data: "Invalid Username or password",
          color: snackbarRed);
    }
    return CommonSnackBAr.snackBar(
        context: context, data: "No internet connection", color: snackbarRed);
  }
}

class Error {
  int? code;
  Object? message;
  Error({this.code, this.message});
}
