import 'package:flutter/material.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/space_wh.dart';
import 'package:turbo_rent/utils/textstyle.dart';

class CommonAppbar extends StatelessWidget {
  final String title;
  final Widget widget;
  final Color color;
  final Color txtClr;
  const CommonAppbar({
    super.key,
    required this.title,
    this.color = Colors.transparent,
    this.txtClr = kBlack,
    this.widget = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(
        color: txtClr,
      ),
      iconTheme: const IconThemeData(color: kBlack),
      backgroundColor: color,
      elevation: 0,
      title: Text(
        title,
        style: textstyle(
          17,
          FontWeight.bold,
          txtClr,
        ),
      ),
      actions: [
        widget,
        const SpaceWH(
          width: 10,
        )
      ],
    );
  }
}
