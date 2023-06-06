import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbo_rent/view_model/all_cars_view_model.dart';
import '../components/all_cars/all_cars.dart';
import '../components/all_cars/car_brand_selection.dart';
import '../components/common/loading_card.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerCar = context.watch<AllCarsViewModel>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          const BrandSelection(),
          providerCar.isLoading
              ? Expanded(
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: const LoadingCard()))
              : AllCars(
                  carData: providerCar.currentBrandIndex == 0
                      ? providerCar.carsDataList
                      : providerCar.currentBrandIndex == 1
                          ? providerCar.audiCarsList
                          : providerCar.currentBrandIndex == 2
                              ? providerCar.benzCarsList
                              : providerCar.currentBrandIndex == 3
                                  ? providerCar.miniCarsList
                                  : providerCar.bmwCarsList,
                ),
        ],
      ),
    );
  }
}
