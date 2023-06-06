import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';
import '../../utils/textstyle.dart';
import '../../view_model/all_cars_view_model.dart';

class BrandSelection extends StatelessWidget {
  const BrandSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var brandList = [
      {
        "name": "All",
        "icon": "",
      },
      {
        "name": "AUDI",
        "icon": "assets/images/AUDI.png",
      },
      {
        "name": "BENZ",
        "icon": "assets/images/Benz.png",
      },
      {
        "name": "MINI",
        "icon": "assets/images/Mini.png",
      },
      {
        "name": "BMW",
        "icon": "assets/images/Bmw.png",
      },
    ];
    final providerCars = context.watch<AllCarsViewModel>();
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              "Brands",
              style: titleCardName,
            ),
          ),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: brandList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () {
                      providerCars.setBrandIndex(index);
                    },
                    child: BrandItem(
                      imgAsset: brandList[index]["icon"]!,
                      index: 0,
                      isSelected: (providerCars.currentBrandIndex == index)
                          ? true
                          : false,
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      providerCars.setBrandIndex(index);
                    },
                    child: BrandItem(
                      imgAsset: brandList[index]["icon"]!,
                      index: index,
                      isSelected: (providerCars.currentBrandIndex == index)
                          ? true
                          : false,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class BrandItem extends StatelessWidget {
  final String imgAsset;
  final int index;
  final bool isSelected;
  const BrandItem({
    super.key,
    required this.imgAsset,
    required this.index,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (index == 0)
          ? const EdgeInsets.fromLTRB(20, 12, 10, 12)
          : const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      padding: (index == 0)
          ? const EdgeInsets.symmetric(horizontal: 25, vertical: 20)
          : const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 7,
            spreadRadius: 0.5,
          )
        ],
        borderRadius: BorderRadius.circular(20),
        color: (isSelected)
            ? kblue
            : (index == 0)
                ? Colors.black
                : Colors.white,
      ),
      child: (index == 0)
          ? const Center(
              child: Icon(
                Icons.grid_view_outlined,
                color: Colors.white,
                size: 30,
              ),
            )
          : Column(
              children: [
                Image.asset(
                  imgAsset,
                  width: 40,
                  height: 40,
                ),
              ],
            ),
    );
  }
}
