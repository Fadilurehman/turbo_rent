import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbo_rent/components/common/commonsnackbar.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/space_wh.dart';
import 'package:turbo_rent/utils/textstyle.dart';
import 'package:turbo_rent/view_model/booking_view_model.dart';

class FooterBoookingInfo extends StatelessWidget {
  const FooterBoookingInfo({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookingViewModel>();
    return Column(
      children: [
        const SpaceWH(height: 10),
        Text(
          provider.totalHors == 0
              ? "Total Hours : 0"
              : "Total Hours : ${provider.totalHors}",
          style: textstyle(17, FontWeight.w500, kBlack),
        ),
        GestureDetector(
          onTap: () {
            if (provider.totalamount <= 0 || provider.totalHors <= 0) {
              CommonSnackBAr.snackBar(
                context: context,
                data: "please check your date and time",
                color: snackbarwarn,
              );
            } else {
              Provider.of<BookingViewModel>(context, listen: false)
                  .bookCar(context: context, index: index);
            }
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 12, 10, 12),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            decoration: BoxDecoration(
              color: maincolor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 7,
                  spreadRadius: 0.5,
                )
              ],
            ),
            child: Text(
              provider.totalamount == 0
                  ? "Total Amount : 0"
                  : "Total Amount : ${provider.totalamount}",
              style: textstyle(17, FontWeight.w500, kwhite),
            ),
          ),
        ),
      ],
    );
  }
}
