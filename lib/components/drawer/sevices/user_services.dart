import 'package:flutter/material.dart';
import 'package:turbo_rent/components/common/common_appbar.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/textstyle.dart';

import '../../../utils/space_wh.dart';

class UserServices extends StatelessWidget {
  const UserServices({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bodyColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CommonAppbar(
          title: "Our Services",
          txtClr: kwhite,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ServiceCard(
              content:
                  'City Transfer has been providing general freight transportation services for over 75 years with founding roots back to 1945 and ownership in its third generation.',
              icon: Icons.location_on,
              title: 'CITY TRANSFER',
            ),
            ServiceCard(
              title: "WHOLE CITY TOUR",
              content:
                  "Urban tourism or also called City tourism is a form of tourism that takes place in the large human agglomerations, usually in the main cities or urban areas of each country.",
              icon: Icons.location_city,
            ),
            ServiceCard(
              title: "UNLIMITED MILES CAR RENTAL",
              content:
                  "You can drive as much as you want without any extra fees. This is the best option if you're planning a road trip or simply don't want to worry about how many miles you're driving.",
              icon: Icons.directions_car_filled_outlined,
            ),
            ServiceCard(
              title: "FAST & EASY BOOKING",
              content:
                  "An online booking system is a software solution that allows potential guests to self-book and pay through your website, and other channels, while giving you the best tools to run and scale your operation, all in one place.",
              icon: Icons.timer_outlined,
            ),
            ServiceCard(
              title: 'MANY PICKUP LOCATIONS',
              content:
                  "Multi-pickup locations feature enables the sellers to define more than one pick up locations so that the shipping agents are able to pick up the shipment from there. This is a feature provided by the shipping companies for the sellers.",
              icon: Icons.add_location_alt_outlined,
            ),
            ServiceCard(
              title: "AIRPORT TRANSFER",
              content:
                  "Airport transfer services are just that. Transfer services that connect the airport to your destination. As these services are designed for those who fly, you need not worry about carrying around heavy luggage.",
              icon: Icons.airplanemode_on,
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    // required this.size,
    required this.title,
    required this.content,
    required this.icon,
  });
  final String title;
  final String content;
  final IconData icon;
  // final Size size;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kwhite,
      ),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: textstyle(16, FontWeight.w800, kBlack),
              ),
              const SpaceWH(
                width: 5,
              ),
              Icon(
                icon,
                color: blueButton,
              )
            ],
          ),
          const SpaceWH(
            height: 20,
          ),
          Text(
            content,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500,
              color: grayText,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
