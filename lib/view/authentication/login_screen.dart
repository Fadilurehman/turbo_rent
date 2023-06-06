import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:turbo_rent/components/common/c_textfield.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/image.dart';
import 'package:turbo_rent/utils/space_wh.dart';
import 'package:turbo_rent/utils/textstyle.dart';
import 'package:turbo_rent/view_model/login_view_model.dart';
import 'signup_screen.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LoginViewModel>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: whiteBG,
        body: SafeArea(
          child: provider.isLoading
              ? Center(
                  child: Lottie.asset("assets/lottie/splashCar.json"),
                )
              : Form(
                  key: _formkey,
                  child: GestureDetector(
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                    child: ListView(
                      children: [
                        SpaceWH(
                          height: size.width * 0.1,
                        ),
                        //greating text

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02),
                          child: Text(
                            "Welcome back! \nGlad to see you, Again!",
                            style: headline,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SpaceWH(
                          height: size.width * 0.2,
                        ),

                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.06,
                                  vertical: size.width * 0.03),
                              child: CommonTextField(
                                prefixIcon: const Icon(Icons.person),
                                controller: provider.emailController,
                                hintText: "Email",
                                keyType: TextInputType.emailAddress,
                                size: size,
                                isEmail: true,
                              ),
                            ),
                            SpaceWH(
                              height: size.width * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.06,
                                  vertical: size.width * 0.03),
                              child: CommonTextField(
                                prefixIcon: const Icon(Icons.key),
                                controller: provider.passwordCntrlr,
                                hintText: "Password",
                                keyType: TextInputType.name,
                                size: size,
                                isPassword: true,
                                isObs: true,
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("forget your password?", style: headline3),
                                SpaceWH(
                                  width: 25,
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.1,
                                  vertical: size.width * 0.09),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      const MaterialStatePropertyAll(kblue),
                                  overlayColor:
                                      MaterialStateProperty.all(Colors.green),
                                ),
                                onPressed: () async {
                                  if (_formkey.currentState!.validate()) {
                                    await context
                                        .read<LoginViewModel>()
                                        .getLoginStatus(context);
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    "Login",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.width * 0.5,
                              width: size.width * 0.5,
                              child: Image.asset(
                                loginImage,
                              ),
                            ),
                            SpaceWH(
                              height: size.width * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(color: kBlack),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const SignUpScreen();
                                        },
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Register Now",
                                    style: TextStyle(
                                      color: specialGreen,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
