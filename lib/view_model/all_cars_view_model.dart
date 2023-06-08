import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:turbo_rent/res/api_services.dart';
import 'package:turbo_rent/res/api_status.dart';
import 'package:turbo_rent/utils/urls.dart';
import '../model/user_all_cars_model.dart';

class AllCarsViewModel extends ChangeNotifier {
  AllCarsViewModel() {
    getAllCars();
  }

  int _currentBrandIndex = 0;
  int get currentBrandIndex => _currentBrandIndex;

  void setBrandIndex(int currentIndex) {
    _currentBrandIndex = currentIndex;
    notifyListeners();
  }

  // CarsDataModel variable
  List<UserCarsModel> _carsDataList = [];
  List<UserCarsModel> get carsDataList => _carsDataList;

  // AUDI Cars variable
  List<UserCarsModel> _audiCarsList = [];
  List<UserCarsModel> get audiCarsList => _audiCarsList;

  // Benz Cars variable
  List<UserCarsModel> _benzCarsList = [];
  List<UserCarsModel> get benzCarsList => _benzCarsList;

// BMW Cars variable
  List<UserCarsModel> _bmwCarsList = [];
  List<UserCarsModel> get bmwCarsList => _bmwCarsList;

// MINI Cars variable
  List<UserCarsModel> _miniCarsList = [];
  List<UserCarsModel> get miniCarsList => _miniCarsList;

//Loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool loading) {
    _isLoading = loading;
    log(_isLoading.toString());
    notifyListeners();
  }

  setPlaceList(List<String> places) {
    notifyListeners();
  }

  setCarsListData(List<UserCarsModel> carsDataList) {
    _carsDataList = carsDataList;
    notifyListeners();
  }

  setAudiCarList(List<UserCarsModel> audicarsList) {
    _audiCarsList = audicarsList;
    notifyListeners();
  }

  setBenzCarList(List<UserCarsModel> benzCarsList) {
    _benzCarsList = benzCarsList;
    notifyListeners();
  }

  setBmwCarList(List<UserCarsModel> bmwCarsList) {
    _bmwCarsList = bmwCarsList;
    notifyListeners();
  }

  setMiniCarList(List<UserCarsModel> miniCarsList) {
    _miniCarsList = miniCarsList;
    notifyListeners();
  }

  //Main Function

  getAllCars() async {
    setLoading(true);
    log("getAllCars");
    String url = Urls.baseUrl + Urls.user + Urls.showAllCars;
    final response =
        await ApiServices.getMEthod(url: url, function: userCarsModelFromJson);
    if (response is Success) {
      log("Cars on viewModel");
      if (response.response != null) {
        setCarsListData(response.response as List<UserCarsModel>);
        List<UserCarsModel> places = [];
        List<UserCarsModel> audiCars = [];
        List<UserCarsModel> bmwCars = [];
        List<UserCarsModel> miniCars = [];
        List<UserCarsModel> benzCars = [];
        for (var element in carsDataList) {
          if (element.brand!.contains("AUDI")) {
            audiCars.add(element);
          } else if (element.brand!.contains("BMW")) {
            bmwCars.add(element);
          } else if (element.brand!.contains("MINI")) {
            miniCars.add(element);
          } else if (element.brand!.contains("MERCEDES BENZ")) {
            benzCars.add(element);
          }
          places.add(element);
          // setPlaceList(places );
          setAudiCarList(audiCars);
          setBmwCarList(bmwCars);
          setMiniCarList(miniCars);
          setBenzCarList(benzCars);
        }
        log("AUDI CARS:${audiCars.length}");
        log("BMW CARS:${audiCars.length}");
        log("MINI CARS:${audiCars.length}");
        log("Benz CARS:${audiCars.length}");
      }
      setLoading(false);
    }
    if (response is Failures) {
      log("cars not found");
      setLoading(false);
    }
  }
}
