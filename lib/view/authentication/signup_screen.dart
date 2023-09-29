import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:turbos_rent/components/common/c_textfield.dart';
import 'package:turbos_rent/utils/colors.dart';
import 'package:turbos_rent/utils/image.dart';
import 'package:turbos_rent/utils/space_wh.dart';
import 'package:turbos_rent/utils/textstyle.dart';
import 'package:turbos_rent/view/authentication/login_screen.dart';
import '../../view_model/signup_view_model.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
// MediaQuery
    final size = MediaQuery.of(context).size;
    final provider = context.watch<UserSignupViewModel>();
    return Scaffold(
      backgroundColor: whiteBG,
      body: provider.isLoading
          ? Center(
              child: Lottie.asset(
                "assets/lottie/splashCar.json",
              ),
            )
          : Form(
              key: provider.signUpFormKey,
              child: GestureDetector(
                onTap: () {
                  FocusScopeNode curentFocus = FocusScope.of(context);
                  if (!curentFocus.hasPrimaryFocus) {
                    curentFocus.unfocus();
                  }
                },
                child: ListView(
                  children: [
                    //*****------------HEADING ----------------*****//
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.06,
                          top: size.width * 0.06,
                          right: size.width * 0.06),
                      child: Text(
                        "Welcome to RENT-A-RIDE",
                        style: headline,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Text(
                      "sign up this page for accessing cars",
                      style: headline4,
                      textAlign: TextAlign.center,
                    ),

                    SpaceWH(
                      height: size.width * 0.1,
                    ),
                    //*****------------USER NAME ----------------*****//
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.07,
                          vertical: size.width * 0.03),
                      child: CommonTextField(
                        prefixIcon: const Icon(Icons.person),
                        size: size,
                        hintText: "Username",
                        controller: provider.nameController,
                        keyType: TextInputType.text,
                        isUser: true,
                      ),
                    ),
                    //*****------------Email ----------------*****//

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.07,
                          vertical: size.width * 0.03),
                      child: CommonTextField(
                        prefixIcon: const Icon(Icons.email),
                        size: size,
                        hintText: "Email",
                        controller: provider.emailController,
                        keyType: TextInputType.emailAddress,
                        isEmail: true,
                      ),
                    ),
                    //*****------------PHONENUMBER ----------------*****//

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.07,
                          vertical: size.width * 0.03),
                      child: CommonTextField(
                        prefixIcon: const Icon(Icons.phone),
                        size: size,
                        hintText: "Phonenumber",
                        controller: provider.phoneNumberController,
                        keyType: TextInputType.phone,
                        isPhone: true,
                      ),
                    ),
                    //*****------------PASSWORD----------------*****//

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.07,
                          vertical: size.width * 0.03),
                      child: CommonTextField(
                        prefixIcon: const Icon(Icons.key),
                        size: size,
                        hintText: "Password",
                        controller: provider.passwordController,
                        keyType: TextInputType.text,
                        isPassword: true,
                        isObs: true,
                      ),
                    ),
                    //*****------------ sign up ----------------*****//
                    Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.2,
                        top: size.width * 0.035,
                        right: size.width * 0.2,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(kblue),
                          overlayColor: MaterialStateProperty.all(Colors.green),
                        ),
                        onPressed: () async {
                          if (provider.signUpFormKey.currentState!.validate()) {
                            await context
                                .read<UserSignupViewModel>()
                                .getSignUpStatus(context);
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Sign up",
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: size.width * 0.5,
                          height: size.width * 0.4,
                          child: Image.asset(
                            signupImage2,
                          )),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "already have an account?",
                          style: TextStyle(color: kBlack),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginPage();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            "Login Now",
                            style: TextStyle(
                              color: Color.fromARGB(255, 53, 194, 193),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
