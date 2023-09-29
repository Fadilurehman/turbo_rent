import 'package:flutter/material.dart';
import 'package:turbos_rent/utils/colors.dart';
import 'package:turbos_rent/utils/textstyle.dart';

class PaymentAppbar extends StatelessWidget {
  final String title;
  final Widget widget;
  final Color color;
  final Color txtClr;
  const PaymentAppbar({
    super.key,
    required this.title,
    this.color = Colors.transparent,
    this.txtClr = kBlack,
    this.widget = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kwhite,
      leading: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: kwhite,
                title: Text(
                  "cancel payment",
                  style: textstyle(14, FontWeight.bold, kBlack),
                ),
                content: const Text(
                    "Are you sure do you want to close the payment Process?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
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
        icon: const Icon(
          Icons.arrow_back,
          color: kBlack,
        ),
      ),
      title: Text(
        title,
        style: textstyle(
          17,
          FontWeight.bold,
          txtClr,
        ),
      ),
    );
  }
}
