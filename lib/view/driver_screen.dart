import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbos_rent/components/common/common_button.dart';
import 'package:turbos_rent/utils/colors.dart';
import 'package:turbos_rent/utils/space_wh.dart';
import 'package:turbos_rent/utils/textstyle.dart';
import 'package:turbos_rent/view/home_screen.dart';
import 'package:turbos_rent/view_model/driver_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DriverViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back,",
                  style: textstyle(
                    20,
                    FontWeight.w600,
                    grayText,
                  ),
                ),
                Text(
                  provider.driverName == null
                      ? "Driver "
                      : provider.driverName!,
                  style: textstyle(
                    20,
                    FontWeight.w600,
                    kBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(
                    "You are successfully Logged in and has approved your Driver request. We will call you when driver is needed.",
                    textAlign: TextAlign.justify,
                    style: textstyle(20, FontWeight.w600, grayText),
                  ),
                ),
                const SpaceWH(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "If you have any complaints or any suggestion please contact us!",
                    style: textstyle(15, FontWeight.w500, kBlack),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: TextButton.icon(
                    onPressed: () async {
                      const url =
                          'mailto:rehmanfadilu@gmail.com?subject=FeedBack &body=Hi,Rent a Ride';
                      Uri uri = Uri.parse(url);
                      await launchUrl(uri);
                    },
                    icon: const Icon(Icons.email),
                    label: Text(
                      "CONTACT US",
                      style: textstyle(
                        15,
                        FontWeight.w500,
                        kBlack,
                      ),
                    ),
                  ),
                ),
                const SpaceWH(height: 40),
                Center(
                  child: CommonButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: kwhite,
                            title: Text(
                              "Log Out",
                              style: textstyle(14, FontWeight.bold, kBlack),
                            ),
                            content: const Text(
                                "Are you sure do you want to logout the Drivers section?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.remove("DRIVER_NAME");
                                  prefs.remove("DRIVER_EMAIL");
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return const HomeScreen();
                                    },
                                  ), (route) => false);
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    color: maincolor.withOpacity(0.8),
                    child: const Text("Log Out"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
