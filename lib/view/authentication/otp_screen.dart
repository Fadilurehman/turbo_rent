import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/image.dart';
import 'package:turbo_rent/utils/space_wh.dart';
import 'package:turbo_rent/utils/textstyle.dart';
import 'package:turbo_rent/view_model/signup_view_model.dart';

FocusNode focusNode = FocusNode();

class UserOtpScreen extends StatelessWidget {
  const UserOtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserSignupViewModel>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteBG,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: provider.isLoading
              ? Center(
                  child: Lottie.asset(
                    "assets/lottie/splashCar.json",
                  ),
                )
              : Form(
                  key: provider.otpFormKey,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: size.height * 0.07,
                      ),
                      Text(
                        'Verification Code',
                        style: headline,
                      ),
                      const SpaceWH(
                        height: 8.0,
                      ),
                      Text(
                        'Please enter the verification code you recieved on phonenumber',
                        style: headline4,
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),

                      /// using of pinput package
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width: size.width,
                          child: Pinput(
                            androidSmsAutofillMethod:
                                AndroidSmsAutofillMethod.smsRetrieverApi,
                            listenForMultipleSmsOnAndroid: true,
                            showCursor: true,
                            cursor: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: 21,
                                height: 1,
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 13, 13, 14),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            length: 6,
                            controller: provider.otpController1,
                            focusNode: focusNode,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            defaultPinTheme: PinTheme(
                              width: 60,
                              height: 60,
                              textStyle: GoogleFonts.poppins(
                                  fontSize: 20, color: kwhite),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(94, 14, 14, 15),
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            focusedPinTheme: PinTheme(
                              width: 60,
                              height: 60,
                              textStyle: GoogleFonts.poppins(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 5, 5, 5),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.05999999865889549),
                                    offset: Offset(0, 3),
                                    blurRadius: 16,
                                  ),
                                ],
                              ),
                            ),
                            validator: (value) {
                              if (value!.length < 6) {
                                return "Enter 6 digit OTP";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.05,
                        ),
                        child: Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll(kblue),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.green),
                            ),
                            onPressed: () async {
                              if (provider.otpFormKey.currentState!
                                  .validate()) {
                                await context
                                    .read<UserSignupViewModel>()
                                    .otpButton(context);
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "Verify",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: size.width * 0.7,
                          width: size.width * 0.7,
                          child: Image.asset(
                            otpImage2,
                          ),
                        ),
                      ),
                      SpaceWH(
                        height: size.width * 0.12,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Resend code?',
                            style: TextStyle(color: specialGreen),
                          ),
                        ),
                      ),
                      SpaceWH(
                        height: size.height * 0.05,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
