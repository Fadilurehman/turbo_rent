import 'package:flutter/material.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/space_wh.dart';
import 'package:turbo_rent/utils/textstyle.dart';

class CarHeaderSection extends StatelessWidget {
  final String carName;
  final String image;
  final String model;
  final Size size;
  const CarHeaderSection({
    super.key,
    required this.carName,
    required this.image,
    required this.model,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.width * 0.7,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 122, 146),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: Stack(
        children: [
// Image
          Positioned(
            left: 50,
            bottom: 20,
            child: Image.network(
              image,
              width: 300,
            ),
          ),
// Other details[car name, rating, Logo]
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 18, 0),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 12,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 7,
                              spreadRadius: 0.5,
                            )
                          ],
                        ),
                        child: Image.asset(
                          "assets/images/carlogo.png",
                          color: Colors.black87,
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              carName,
                              style: textstyle(
                                25,
                                FontWeight.w400,
                                kwhite,
                              ),
                            ),
                            const SpaceWH(height: 5),
                            Text(
                              model,
                              style: textstyle(
                                18,
                                FontWeight.w500,
                                kwhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          Text(
                            "5.0",
                            style: textstyle(
                              20,
                              FontWeight.w400,
                              kwhite,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
