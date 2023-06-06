import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbo_rent/view/splash_screen.dart';
import 'package:turbo_rent/view_model/login_view_model.dart';
import 'package:turbo_rent/view_model/signup_view_model.dart';

import 'view_model/all_cars_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserSignupViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AllCarsViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Turbo-Rent',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}