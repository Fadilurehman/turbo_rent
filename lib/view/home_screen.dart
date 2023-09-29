import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbos_rent/components/home/available_cars.dart';
import 'package:turbos_rent/components/home/section_offer.dart';
import 'package:turbos_rent/components/home/user_drawer.dart';
import 'package:turbos_rent/utils/textstyle.dart';
import 'package:turbos_rent/view_model/login_view_model.dart';
import 'package:turbos_rent/utils/colors.dart';
import '../components/home/driver_ads.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.watch<LoginViewModel>();
    return Scaffold(
      backgroundColor: kwhite,
      drawer: const Drawer(
        child: UserDrawer(),
      ),
      appBar: AppBar(
        backgroundColor: maincolor,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Heeyy!!",
              style: textstyle(13, FontWeight.bold, kwhite),
            ),
            Text(
              provider.userName == null
                  ? "User"
                  : provider.userName!.toUpperCase(),
              style: textstyle(20, FontWeight.bold, kwhite),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionOffer(size: size),
            AvailableCars(size: size),
            HomeDriverAds(size: size)
          ],
        ),
      ),
    );
  }
}
