import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/view/car_list.dart';

class SectionOffer extends StatelessWidget {
  final List images = [
    "assets/images/car1.png",
    "assets/images/car2.png",
    "assets/images/car3.png",
  ];

  final List offers = [
    "50%",
    "35%",
    "20%",
  ];
  final List carNAme = [
    "Audi",
    "Toyota Fortuner",
    "Dodge Challenger",
  ];

  SectionOffer({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
            ),
            color: maincolor,
          ),
          height: size.height * 0.28,
        ),
        SizedBox(
          height: size.height * 0.32,
          child: Swiper(
            autoplay: true,
            itemCount: 3,
            pagination: const SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder:
                  DotSwiperPaginationBuilder(color: kBlack, activeColor: kblue),
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CarListScreen();
                      },
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Positioned(
                      left: size.width * 0.07,
                      bottom: size.width * 0.09,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kwhite,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.black38,
                            )
                          ],
                        ),
                        height: size.height * 0.27,
                        width: size.height * 0.37,
                      ),
                    ),
                    Positioned(
                      bottom: size.width * 0.05,
                      right: size.width * 0.05,
                      child: SizedBox(
                        child: Image.asset(
                          images[index],
                          width: size.width * 0.7,
                        ),
                      ),
                    ),
                    Positioned(
                      left: size.width * 0.10,
                      bottom: size.width * 0.56,
                      child: Text(
                        carNAme[index],
                        style: GoogleFonts.baskervville(
                          color: bodyColor,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                          fontSize: size.width * 0.05,
                        ),
                      ),
                    ),
                    Positioned(
                      left: size.width * 0.10,
                      bottom: size.width * 0.44,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Need Some More",
                            style: GoogleFonts.roboto(
                              color: hashColor,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                              fontSize: size.width * 0.04,
                            ),
                          ),
                          Text(
                            "${offers[index]} OFF",
                            style: GoogleFonts.roboto(
                              color: const Color.fromARGB(255, 53, 194, 193),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              fontSize: size.width * 0.075,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
