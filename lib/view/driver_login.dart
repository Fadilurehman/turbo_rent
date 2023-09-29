import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbos_rent/components/common/c_textfield.dart';
import 'package:turbos_rent/components/common/common_appbar.dart';
import 'package:turbos_rent/components/common/common_button.dart';
import 'package:turbos_rent/utils/colors.dart';
import 'package:turbos_rent/utils/space_wh.dart';
import 'package:turbos_rent/view/driver_signup.dart';
import 'package:turbos_rent/view_model/driver_view_model.dart';

GlobalKey<FormState> driverLoginForm = GlobalKey<FormState>();

class DriverLogin extends StatelessWidget {
  const DriverLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.watch<DriverViewModel>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: CommonAppbar(
          title: "Welcome Back!",
          widget: TextButton(
            onPressed: () {
              provider.clearController();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DriverSignup();
                  },
                ),
              );
            },
            child: const Text("Don't have any account.? "),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode curentFocus = FocusScope.of(context);
          if (!curentFocus.hasPrimaryFocus) {
            curentFocus.unfocus();
          }
        },
        child: Form(
          key: driverLoginForm,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const SpaceWH(height: 20),
                CommonTextField(
                  isEmail: true,
                  prefixIcon: const Icon(Icons.email),
                  controller: provider.loginEmailcntrlr,
                  hintText: "Email",
                  keyType: TextInputType.emailAddress,
                  size: size,
                ),
                const SpaceWH(height: 20),
                CommonTextField(
                  isObs: true,
                  isPassword: true,
                  prefixIcon: const Icon(Icons.key),
                  controller: provider.loginPswrdcntrlr,
                  hintText: "Password",
                  keyType: TextInputType.text,
                  size: size,
                ),
                const SpaceWH(height: 30),
                provider.isLoading
                    ? CommonButton(
                        onTap: () {},
                        color: kBlack,
                        child: const Text("LOADING..."),
                      )
                    : CommonButton(
                        color: maincolor,
                        child: const Text(
                          "Login",
                        ),
                        onTap: () {
                          if (driverLoginForm.currentState!.validate()) {
                            provider.driverLoginService(context);
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
