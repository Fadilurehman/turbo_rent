import 'package:flutter/material.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/space_wh.dart';
import 'package:turbo_rent/utils/textstyle.dart';
import 'package:turbo_rent/view/home_screen.dart';

class PaymentVarified extends StatelessWidget {
  const PaymentVarified({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/Paymentsuccessful21.png",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            const SpaceWH(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: maincolor,
                  fixedSize: const Size(70, 40),
                ),
                child: Text(
                  "OK",
                  style: textstyle(20, FontWeight.bold, kwhite),
                ),
              ),
            ),
            const SpaceWH(height: 10),
            Text(
              "Click ok to return HomePage",
              style: textstyle(12, FontWeight.bold, kgrey),
            ),
          ],
        ),
      ),
    );
  }
}
