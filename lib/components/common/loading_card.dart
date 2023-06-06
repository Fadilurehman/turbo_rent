import 'package:flutter/material.dart';
import '../../utils/space_wh.dart';
import 'common_shimmer.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 0.5,
                blurRadius: 15,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonShimmer.circular(
                    height: 70,
                    width: 120,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SpaceWH(height: 20),
                  const CommonShimmer.rectangular(
                    height: 15,
                    width: 100,
                  ),
                  const SpaceWH(height: 10),
                  const CommonShimmer.rectangular(
                    height: 15,
                    width: 100,
                  ),
                  const SpaceWH(height: 10),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SpaceWH(height: 20),
                  CommonShimmer.rectangular(
                    height: 20,
                    width: 100,
                  ),
                  SpaceWH(height: 10),
                  CommonShimmer.rectangular(
                    height: 15,
                    width: 70,
                  ),
                  SpaceWH(height: 10),
                  CommonShimmer.circular(
                    height: 40,
                    width: 100,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
