import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbo_rent/view/authentication/login_screen.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/image.dart';
import 'package:turbo_rent/utils/space_wh.dart';
import 'package:turbo_rent/utils/text_style.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //MediaQuery
    final size = MediaQuery.of(context).size;

    //animated splash

    return FutureBuilder(
        future: loggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }
          return AnimatedSplashScreen(
            backgroundColor: whiteBG,
            splashIconSize: double.infinity,
            duration: 3000,
            splash: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Title
                Text(
                  "TURBO-RENT",
                  style: splashHead,
                ),
                SpaceWH(height: size.width * 0.1),
                //splash logo

                SizedBox(
                  width: size.width * 0.8,
                  child: Image.asset(splashImg),
                ),
                SpaceWH(height: size.width * 0.1),
                Text(
                  "~The Rent partner you never had~",
                  style: splashBottom,
                ),
              ],
            ),
            nextScreen: snapshot.data!,
            splashTransition: SplashTransition.fadeTransition,
          );
        });
  }

  Future<Widget> loggedIn() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    if (isLoggedIn == false) {
      return LoginPage();
    } else {
      return const HomeScreen();
    }
  }
}
