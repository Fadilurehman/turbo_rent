import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:turbo_rent/utils/space_wh.dart';
import '../../model/user_all_cars_model.dart';
import '../../utils/colors.dart';
import '../../view/car_details.dart';

class CarItems extends StatelessWidget {
  final List<UserCarsModel> carData;

  final int index;
  const CarItems({
    super.key,
    required this.index,
    required this.carData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 20, top: 20),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0.5,
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SpaceWH(
                          height: 20,
                        ),
                        Text(
                          carData[index].name.toString().toUpperCase(),
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          carData[index].model.toString(),
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: snackbarRed,
                              ),
                              Text(
                                carData[index].place.toString(),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.currency_rupee,
                                color: specialGreen,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: "${carData[index].rent}"),
                                    const TextSpan(
                                      text: "/day",
                                      style: TextStyle(
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SpaceWH(
                            height: 10,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 130,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                  child:
                                      const CarDetailsScreen(), //not completed
                                  type: PageTransitionType.scale,
                                  duration: const Duration(
                                    milliseconds: 700,
                                  ),
                                  alignment: Alignment.center,
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueButton,
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                          ),
                          child: Text(
                            "Details",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400, fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: Image.network(
              carData[index].image!,
              width: 140,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
