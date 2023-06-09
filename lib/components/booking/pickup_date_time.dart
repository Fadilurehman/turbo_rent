import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/space_wh.dart';
import 'package:turbo_rent/utils/textstyle.dart';
import 'package:turbo_rent/view_model/booking_view_model.dart';

class PickUpDateTime extends StatelessWidget {
  const PickUpDateTime({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookingViewModel>();
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "please select pickup date and time",
          style: textstyle(15, FontWeight.w500, kBlack),
        ),
        const SpaceWH(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(5),
              width: size.width * 0.4,
              decoration: const BoxDecoration(gradient: specialCard2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SpaceWH(width: 3),
                  provider.checkPickupDate(),
                  IconButton(
                    onPressed: () async {
                      await provider.getPickupDate(context);
                      // ignore: use_build_context_synchronously
                      provider.getPickupTime(context, index);
                    },
                    icon: const Icon(
                      Icons.calendar_month,
                      color: kwhite,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(5),
              width: size.width * 0.35,
              decoration: const BoxDecoration(gradient: specialCard2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SpaceWH(width: 3),
                  provider.checkPickupTime(),
                  IconButton(
                    onPressed: () async {
                      await provider.getPickupTime(context, index);
                    },
                    icon: const Icon(
                      Icons.schedule,
                      color: kwhite,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
