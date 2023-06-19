import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbo_rent/components/driver/license_image_pick.dart';
import 'package:turbo_rent/components/driver/signup_form.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/space_wh.dart';
import 'package:turbo_rent/utils/textstyle.dart';
import 'package:turbo_rent/view/driver_login.dart';
import 'package:turbo_rent/view/home_screen.dart';
import 'package:turbo_rent/view_model/driver_view_model.dart';

class DriverSignup extends StatelessWidget {
  const DriverSignup({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DriverViewModel>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: kBlack,
          onPressed: () {
            provider.clearController();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false);
          },
        ),
        backgroundColor: kwhite,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              provider.clearController();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DriverLogin();
                  },
                ),
              );
            },
            child: const Text("Already have an account.? "),
          ),
          const SpaceWH(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: GestureDetector(
            onTap: () {
              FocusScopeNode curentFocus = FocusScope.of(context);
              if (!curentFocus.hasPrimaryFocus) {
                curentFocus.unfocus();
              }
            },
            child: Column(
              children: [
                Center(
                  child: Text(
                    "please fill the form to join with us!",
                    style: textstyle(15, FontWeight.w500, kBlack),
                  ),
                ),
                const SpaceWH(height: 20),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: provider.dpColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: provider.driverImage == null
                              ? const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8ecCwEDhH9DHAJxTV6yFkldZ5fATYSFnGsbrqizN9-w&usqp=CAU&ec=48600113",
                                  ),
                                )
                              : DecorationImage(
                                  image: FileImage(
                                    provider.driverImage!,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: kwhite,
                            ),
                            color: blueButton,
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              await context.read<DriverViewModel>().pickImage();
                            },
                            child: const Icon(
                              Icons.add_a_photo,
                              color: kwhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SpaceWH(height: 20),
                LicenseImagePick(
                  borderClr: provider.licnsImg1,
                  size: size,
                  childs: provider.licenseFrontView == null
                      ? TextButton(
                          onPressed: () async {
                            await context
                                .read<DriverViewModel>()
                                .picklicense1();
                          },
                          child: const Text("DRIVING LICENSE   [FRONT SIDE]"),
                        )
                      : Image.file(
                          provider.licenseFrontView!,
                          fit: BoxFit.contain,
                        ),
                  onTap: () async {
                    await context.read<DriverViewModel>().picklicense1();
                  },
                ),
                const SpaceWH(height: 20),
                LicenseImagePick(
                  borderClr: provider.licnsImg2,
                  size: size,
                  childs: provider.licenseRearView == null
                      ? TextButton(
                          onPressed: () async {
                            await context
                                .read<DriverViewModel>()
                                .picklicense2();
                          },
                          child: const Text("DRIVING LICENSE   [BACK SIDE]"),
                        )
                      : Image.file(
                          provider.licenseRearView!,
                          fit: BoxFit.contain,
                        ),
                  onTap: () async {
                    await context.read<DriverViewModel>().picklicense2();
                  },
                ),
                const SpaceWH(height: 20),
                DriverSignUPForm(size: size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
