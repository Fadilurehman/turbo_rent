import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbo_rent/components/common/commonsnackbar.dart';
import 'package:turbo_rent/model/booking_details_model.dart';
import 'package:turbo_rent/model/car_booking_model.dart';
import 'package:turbo_rent/res/api_services.dart';
import 'package:turbo_rent/res/api_status.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/textstyle.dart';
import 'package:turbo_rent/utils/urls.dart';
import 'package:turbo_rent/view/payment/car_payment.dart';
import 'package:turbo_rent/view_model/all_cars_view_model.dart';
import 'package:turbo_rent/view_model/places_view_model.dart';

class BookingViewModel extends ChangeNotifier {
  BookingDetails? _bookingDetail;
  BookingDetails? get bookingDetail => _bookingDetail;

  DateTime currentDate = DateTime.now();

  TimeOfDay currentTime = TimeOfDay.now();

  int _totalAmount = 0;
  int get totalamount => _totalAmount;

  num _totalHours = 0;
  num get totalHors => _totalHours;

  Errors? _error;
  Errors? get error => _error;

  DateTime _pickDateTime = DateTime.now();
  DateTime get pickDateTime => _pickDateTime;

  DateTime _dropDateTime = DateTime.now();
  DateTime get dropDateTime => _dropDateTime;

  TimeOfDay _pickupTime = TimeOfDay.now();
  TimeOfDay get pickupTime => _pickupTime;

  TimeOfDay _dropoffTime = TimeOfDay.now();
  TimeOfDay get dropoffTime => _dropoffTime;

  DateTime _pickupDate = DateTime.now();
  DateTime get pickupDate => _pickupDate;

  DateTime _dropoffDate = DateTime.now();
  DateTime get dropoffDate => _dropoffDate;

  bool _isDriverRequired = false;
  bool get isDriverRequired => _isDriverRequired;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _userId;
  String? get userId => _userId;

  setError(Errors error, context) async {
    _error = error;
    return errorResponses(_error!, context);
  }

  setBookingDetails(BookingDetails? detailsList) {
    _bookingDetail = detailsList;
    log(_bookingDetail!.totalAmount.toString());
    notifyListeners();
  }

  isDriver(bool value) {
    _isDriverRequired = value;
    notifyListeners();
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  setTotalAmount(int totaAmnt) {
    _totalAmount = totaAmnt;
    notifyListeners();
  }

  setTotalHours(num totalHrs) {
    _totalHours = totalHrs;
    notifyListeners();
  }

  finalPickDate(DateTime pickDT) {
    _pickDateTime = pickDT;
    notifyListeners();
  }

  finalDropDate(DateTime dropDT) {
    _dropDateTime = dropDT;
    notifyListeners();
  }

  setPickUpDate(DateTime newPickDate) {
    _pickupDate = newPickDate;
    notifyListeners();
  }

  setDropOffDate(DateTime newDropDate) {
    _dropoffDate = newDropDate;
    notifyListeners();
  }

  setPickUpTime(TimeOfDay newPickTime) {
    _pickupTime = newPickTime;
    notifyListeners();
  }

  setDropOffTime(TimeOfDay newDropTime) {
    _dropoffTime = newDropTime;
    notifyListeners();
  }

  //GET THE ACCESSTOKEN
  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("ACCESS_TOKEN");
    return accessToken;
  }

  //GET THE ACCESSTOKEN
  getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString("USER_ID");
    notifyListeners();
    return _userId;
  }

  //GET PICK UP DATE
  getPickupDate(context) async {
    DateTime? newPickDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2040),
    );
    if (newPickDate == null) {
      return;
    } else {
      setPickUpDate(newPickDate);
    }
  }

// GET DROP OFF DATE
  getDropOffDate(context) async {
    DateTime? newDropDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2040),
    );
    if (newDropDate == null) {
      log("alkdbfaj");
      return;
    } else {
      setDropOffDate(newDropDate);
      log("Time**********${newDropDate.toIso8601String()}");
    }
  }

// GET PICK UP TIME
  getPickupTime(context, index) async {
    TimeOfDay? newPickTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
    );
    if (newPickTime != null) {
      setPickUpTime(newPickTime);
      // checkTotalAmount(context, index);
      getTheTotalHours(context, index);
    }
  }

// GET DROPOFF TIME
  getDropOffTime(context, index) async {
    TimeOfDay? newDropTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
    );
    if (newDropTime != null) {
      setDropOffTime(newDropTime);
      getTheTotalHours(context, index);
    }
  }

// SHOW PICK UP DATE
  checkPickupDate() {
    return Text(
      _pickupDate == DateTime.now()
          ? "Date"
          : "${_pickupDate.day}/${_pickupDate.month}/${_pickupDate.year}",
      style: textstyle(17, FontWeight.bold, kwhite),
    );
  }

// SHOW  DROP OFF DATE

  checkDropOffDate() {
    return Text(
      _dropoffDate == DateTime.now()
          ? "Date"
          : "${_dropoffDate.day}/${_dropoffDate.month}/${_dropoffDate.year}",
      style: textstyle(17, FontWeight.bold, kwhite),
    );
  }

// SHOW  PICK UP DATE
  checkPickupTime() {
    String hour = _pickupTime == TimeOfDay.now()
        ? ""
        : _pickupTime.hour.toString().padLeft(2, "0");
    String minutes = _pickupTime == TimeOfDay.now()
        ? ""
        : _pickupTime.minute.toString().padLeft(2, "0");
    return Text(
      _pickupTime == TimeOfDay.now() ? "Time" : "$hour:$minutes",
      style: textstyle(17, FontWeight.bold, kwhite),
    );
  }

// SHOW  DROP OFF TIME
  checkDropOffTime() {
    String hour = _dropoffTime == TimeOfDay.now()
        ? ""
        : _dropoffTime.hour.toString().padLeft(2, "0");
    String minutes = _dropoffTime == TimeOfDay.now()
        ? ""
        : _dropoffTime.minute.toString().padLeft(2, "0");
    return Text(
      dropoffTime == TimeOfDay.now() ? "Time" : "$hour:$minutes",
      style: textstyle(17, FontWeight.bold, kwhite),
    );
  }

// GET THE TOTAL HOURS AND SHOW TO THE UI
  getTheTotalHours(context, index) async {
    _pickDateTime = DateTime(
      _pickupDate.year,
      _pickupDate.month,
      _pickupDate.day,
      _pickupTime.hour,
      _pickupTime.minute,
    );
    _dropDateTime = DateTime(
      _dropoffDate.year,
      _dropoffDate.month,
      _dropoffDate.day,
      _dropoffTime.hour,
      _dropoffTime.minute,
    );
    Duration duration = _dropDateTime.difference(_pickDateTime);
    await setTotalHours(duration.inHours);
    await checkTotalAmount(context, index);
  }

// CHECK TOTAL AMOUNT
  checkTotalAmount(context, index) {
    final provider =
        Provider.of<AllCarsViewModel>(context, listen: false).carsDataList;
    log(" car rent:${provider[index].rent!}");
    final withoutDriver = int.parse(provider[index].rent!) * _totalHours;

    log("without Driver : $withoutDriver");
    final withDriver = withoutDriver + (_totalHours * 100);
    log("with Driver : $withDriver");
    _isDriverRequired
        ? setTotalAmount(withDriver.toInt())
        : setTotalAmount(withoutDriver.toInt());
  }

  bookCar({required context, required index}) async {
    setLoading(true);
    final bookcarBody = await bookCarBody(context: context, index: index);
    final url = Urls.baseUrl + Urls.user + Urls.userCarBook;
    final accessToken = await getAccessToken();
    var headers = {"authorization": "Bearer $accessToken"};
    final response = await ApiServices.postMethod(
        context: context,
        url: url,
        data: bookcarBody,
        headers: headers,
        function: bookingDetailsFromJson);

    if (response is Success) {
      log("we are on payment section");
      if (response.response != null) {
        setBookingDetails(response.response as BookingDetails);
        clearController();
        Navigator.of(context).push(
          PageTransition(
            child: CarPaymentScreen(
              index: index,
            ),
            type: PageTransitionType.bottomToTop,
            duration: const Duration(
              milliseconds: 400,
            ),
          ),
        );
      }
    }
    if (response is Failures) {
      log("something went wrong in booking section");
      setLoading(false);
      Errors errors = Errors(
        code: response.code,
        message: response.errrorResponse,
      );
      await setError(errors, context);
    }
  }

  // BOOKING CAR BODY
  Future<Map<String, dynamic>> bookCarBody(
      {required context, required index}) async {
    final providerCar =
        Provider.of<AllCarsViewModel>(context, listen: false).carsDataList;
    final providerPlace = Provider.of<PlacesViewModel>(context, listen: false);
    final userid = await getUserId();
    final body = BookCarDataModel(
      car: providerCar[index].id,
      user: userid,
      dropOffDate: _dropDateTime.toIso8601String(),
      pickUpDate: _pickDateTime.toIso8601String(),
      driverRequire: _isDriverRequired.toString(),
      dropOffCity: providerPlace.dropbutton,
      totalAmount: _totalAmount.toString(),
      totalDays: _totalHours.toString(),
    );
    return body.toJson();
  }

  clearController() {
    _pickDateTime = DateTime.now();
    _dropDateTime = DateTime.now();
    _dropoffDate = DateTime.now();
    _dropDateTime = DateTime.now();
    _pickupDate = DateTime.now();
    _pickupTime = TimeOfDay.now();
    _isDriverRequired = false;
    _totalAmount = 0;
    _totalHours = 0;
  }

  errorResponses(Errors error, BuildContext context) {
    final statusCode = error.code;

    if (statusCode == 400 || statusCode == 401) {
      return CommonSnackBAr.snackBar(
          context: context,
          data: "Slot is Already Reserved",
          color: snackbarRed);
    }
    return CommonSnackBAr.snackBar(
      context: context,
      data: "No internet connection or create an Account",
      color: snackbarRed,
    );
  }

  Future<void> payment() async {
    try {} catch (error) {
      throw Exception(error);
    }
  }
}

class Errors {
  int? code;
  Object? message;

  Errors({
    this.code,
    this.message,
  });
}
