import 'package:flutter/material.dart';
import 'package:turbo_rent/components/car_details/about_car.dart';
import 'package:turbo_rent/components/car_details/car_header.dart';
import 'package:turbo_rent/components/car_details/car_specifications.dart';
import 'package:turbo_rent/model/user_all_cars_model.dart';
import 'package:turbo_rent/utils/space_wh.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen(
      {super.key, required this.carData, required this.index});

  final List<UserCarsModel> carData;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //HEADER PART

            CarHeaderSection(
              carName: carData[index].name.toString(),
              image: carData[index].image.toString(),
              model: carData[index].model.toString(),
              size: size,
            ),
            const SpaceWH(height: 20),

            //Car Specification

            CarSpecifications(
              carData: carData,
              index: index,
            ),

            //Car description and place

            AboutCar(
                details: carData[index].description.toString(),
                place: carData[index].place.toString())
          ],
        ),
      ),
    );
  }
}
