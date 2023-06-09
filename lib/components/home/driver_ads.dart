import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/space_wh.dart';
import '../../utils/textstyle.dart';

class HomeDriverAds extends StatelessWidget {
  const HomeDriverAds({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 15, 0, 10),
      height: size.width * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Special Offer",
            style: titleCardName,
          ),
          const SpaceWH(height: 15),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                width: size.height * 0.37,
                height: size.height * 0.27,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kwhite,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.black38,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/carOtp2.png",
                            ),
                            fit: BoxFit.cover),
                      ),
                      height: 150,
                    )
                  ],
                ),
              ),
              Positioned(
                left: 75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SpaceWH(height: 10),
                    Text(
                      "Do you want to earn with us?",
                      style: textstyle(
                        15,
                        FontWeight.w600,
                        kBlack,
                      ),
                    ),
                    const SpaceWH(height: 5),
                    Text(
                      "so don't be late!",
                      style: textstyle(
                        15,
                        FontWeight.w500,
                        hashColor,
                      ),
                    ),
                    const SpaceWH(height: 15),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const DriverSignup(), not finished
                        //   ),
                        // );
                      },
                      child: Container(
                        height: 45,
                        width: size.width * 0.5,
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 14),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 7,
                                spreadRadius: 0.5,
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: maincolor),
                        child: Center(
                          child: Text(
                            " BECOME A DRIVER ",
                            style: textstyle(
                              15,
                              FontWeight.w700,
                              kwhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // CommonButton(
                    //   onTap: () {
                    //     p.pay(amount: "100", context: context);
                    //   },
                    //   color: blueButton,
                    //   child: const Text("Test 1"),
                    // ),
                    // CommonButton(
                    //   onTap: () {
                    //     s.payAmount(context, "1000");
                    //   },
                    //   color: blueButton,
                    //   child: const Text("Test 2"),
                    // ),
                    Container(
                      height: 80,
                      width: 180,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/driveraccount.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
