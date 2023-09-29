import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbos_rent/components/common/c_textfield.dart';
import 'package:turbos_rent/components/common/common_button.dart';
import 'package:turbos_rent/components/common/commonsnackbar.dart';
import 'package:turbos_rent/utils/colors.dart';
import 'package:turbos_rent/utils/space_wh.dart';
import 'package:turbos_rent/view_model/driver_view_model.dart';

GlobalKey<FormState> driverFormK = GlobalKey<FormState>();

class DriverSignUPForm extends StatelessWidget {
  const DriverSignUPForm({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DriverViewModel>();
    return Form(
      key: driverFormK,
      child: Column(
        children: [
          CommonTextField(
            isUser: true,
            prefixIcon: const Icon(Icons.person),
            controller: provider.nameController,
            hintText: "Username",
            keyType: TextInputType.text,
            size: size,
          ),
          const SpaceWH(height: 10),
          CommonTextField(
            isEmail: true,
            prefixIcon: const Icon(Icons.email),
            controller: provider.emailController,
            hintText: "Email",
            keyType: TextInputType.emailAddress,
            size: size,
          ),
          const SpaceWH(height: 10),
          CommonTextField(
            isPhone: true,
            prefixIcon: const Icon(Icons.phone),
            controller: provider.phoneNumberController,
            hintText: "Phonenumber",
            keyType: TextInputType.phone,
            size: size,
          ),
          const SpaceWH(height: 10),
          CommonTextField(
            isObs: true,
            isPassword: true,
            prefixIcon: const Icon(Icons.key),
            controller: provider.passwordController,
            hintText: "Password",
            keyType: TextInputType.text,
            size: size,
          ),
          const SpaceWH(height: 20),
          provider.isLoading
              ? CommonButton(
                  onTap: () {},
                  color: kBlack,
                  child: const Text("LOADING..."),
                )
              : CommonButton(
                  color: maincolor,
                  onTap: () async {
                    if (driverFormK.currentState!.validate()) {
                      if (provider.driverImage == null) {
                        CommonSnackBAr.snackBar(
                          context: context,
                          data: "please upload your profile picture",
                          color: snackbarwarn,
                        );
                        provider.setDpError(snackbarRed);
                      } else if (provider.licenseFrontView == null) {
                        CommonSnackBAr.snackBar(
                          context: context,
                          data: "please upload license front image",
                          color: snackbarwarn,
                        );
                        provider.setLcnsImg1(snackbarRed);
                      } else if (provider.licenseRearView == null) {
                        CommonSnackBAr.snackBar(
                          context: context,
                          data: "please upload license Rear image",
                          color: snackbarwarn,
                        );
                        provider.setLcnsImg2(snackbarRed);
                      } else {
                        await context
                            .read<DriverViewModel>()
                            .driverSignupService(context);
                      }
                    }
                  },
                  child: const Text("SUBMIT"),
                )
        ],
      ),
    );
  }
}
