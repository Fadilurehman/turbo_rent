import 'package:flutter/material.dart';
import 'package:turbo_rent/components/all_cars/car_items.dart';
import '../../model/user_all_cars_model.dart';
import '../../utils/textstyle.dart';

class AllCars extends StatelessWidget {
  const AllCars({super.key, required this.carData});
  final List<UserCarsModel> carData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Available Cars",
                  style: titleCardName,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.sort),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: carData.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return CarItems(
                    carData: carData,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
