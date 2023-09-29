import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbos_rent/model/my_bookings_model.dart';
import 'package:turbos_rent/res/api_services.dart';
import 'package:turbos_rent/res/api_status.dart';
import 'package:turbos_rent/utils/urls.dart';

class MyBookingsViewModel extends ChangeNotifier {
  MyBookingsViewModel() {
    myBookings();
  }

  List<MyBookingsModel> _bookingList = [];
  List<MyBookingsModel> get bookingList => _bookingList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setBookingListData(List<MyBookingsModel> bookingsList) {
    _bookingList = bookingsList;
    notifyListeners();
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  //GET THE ACCESSTOKEN
  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("ACCESS_TOKEN");
    return accessToken;
  }

  //GET THE ACCESSTOKEN
  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("USER_ID");
    return userId;
  }

  myBookings() async {
    setLoading(true);
    final accessToken = await getAccessToken();
    final userId = await getUserId();
    final url = "${Urls.baseUrl + Urls.user + Urls.userBookings}?id=$userId";
    var headers = {"authorization": "Bearer $accessToken"};
    final response = await ApiServices.getMEthod(
      url: url,
      function: myBookingsModelListFromJson,
      headers: headers,
    );
    if (response is Success) {
      if (response.response != null) {
        log("My bookings success");
        setBookingListData(response.response as List<MyBookingsModel>);
      }
      setLoading(false);
    }
    if (response is Failures) {
      setLoading(false);
      log(response.errrorResponse.toString());
      log("My bookings asjhdvj,hv");
    }
  }
}
