import 'package:flutter/material.dart';
import 'package:turbo_rent/components/common/common_shimmer.dart';
import 'package:turbo_rent/utils/space_wh.dart';

class AvailableCarsShimmer extends StatelessWidget {
  const AvailableCarsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Card(
        child: Column(
          children: [
            const SpaceWH(height: 10),
            CommonShimmer.circular(
              height: 60,
              width: 120,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SpaceWH(height: 30),
            const CommonShimmer.rectangular(
              height: 20,
              width: 140,
            ),
            const SpaceWH(height: 20),
            const CommonShimmer.rectangular(
              height: 15,
              width: 100,
            ),
            const SpaceWH(height: 20),
            const CommonShimmer.rectangular(
              height: 30,
              width: 140,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
            const SpaceWH(height: 10),
          ],
        ),
      ),
    );
  }
}
