import 'package:flutter/material.dart';
import 'package:turbos_rent/model/user_all_cars_model.dart';
import 'package:turbos_rent/utils/colors.dart';
import 'package:turbos_rent/utils/space_wh.dart';
import 'package:turbos_rent/utils/textstyle.dart';

class CarSpecifications extends StatelessWidget {
  const CarSpecifications(
      {super.key, required this.carData, required this.index});
  final List<UserCarsModel> carData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 15, 0, 10),
          child: Text(
            "Specification",
            style: titleCardName,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 100,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CarsSpecificationCard(
                  title: "${carData[index].rent}/hr",
                  content: "Rent",
                ),
                CarsSpecificationCard(
                  title: carData[index].fuel.toString(),
                  content: "Fuel",
                ),
                CarsSpecificationCard(
                  title: carData[index].brand.toString(),
                  content: "Brand",
                ),
                CarsSpecificationCard(
                  title: carData[index].model.toString(),
                  content: "Model",
                ),
                CarsSpecificationCard(
                  title: carData[index].body.toString(),
                  content: "Body",
                ),
                CarsSpecificationCard(
                  title: carData[index].transmission.toString(),
                  content: "Type",
                ),
                const SpaceWH(width: 20)
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CarsSpecificationCard extends StatelessWidget {
  final String title;
  final String content;
  const CarsSpecificationCard({
    super.key,
    required this.title,
    this.content = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        gradient: specialCard2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
              style: textstyle(
                15,
                FontWeight.w400,
                kgrey,
              ),
            ),
            const SpaceWH(height: 10),
            Text(
              title,
              style: textstyle(
                18,
                FontWeight.w500,
                kwhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
