import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:turbos_rent/components/drawer/bookings/user_booking_details.dart';
import 'package:turbos_rent/utils/colors.dart';
import 'package:turbos_rent/utils/space_wh.dart';
import 'package:turbos_rent/utils/textstyle.dart';
import 'package:turbos_rent/view_model/my_bookings_view_model.dart';

class BookingCard extends StatelessWidget {
  final int index;
  const BookingCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MyBookingsViewModel>();
    DateTime pickUp = DateTime.parse(
        provider.bookingList[index].bookedSlots!.from ??
            "2023-00-00T00:00:00.000");
    String pickUpMonth = DateFormat.MMM().format(pickUp);
    DateTime dropOff = DateTime.parse(
        provider.bookingList[index].bookedSlots!.to ??
            "2023-00-00T00:00:00.000");
    String dropOffMonth = DateFormat.MMM().format(dropOff);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 0.5,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SpaceWH(
                            height: 20,
                          ),
                          Text(
                            provider.bookingList[index].carData![0].name!
                                .toUpperCase(),
                            style: textstyle(16, FontWeight.bold, kBlack),
                          ),
                          const SpaceWH(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "STATUS : ",
                                style: textstyle(14, FontWeight.w400, kBlack),
                              ),
                              Text(
                                provider.bookingList[index].status!
                                    .toString()
                                    .toUpperCase(),
                                style:
                                    textstyle(15, FontWeight.bold, hashColor),
                              ),
                            ],
                          ),
                          const SpaceWH(height: 10),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: Color.fromARGB(255, 0, 49, 92),
                                ),
                                const SpaceWH(width: 5),
                                Text(
                                  "FROM :  ",
                                  style: textstyle(14, FontWeight.w400, kBlack),
                                ),
                                Text(
                                  "${pickUp.day} $pickUpMonth ${pickUp.year}",
                                  style: const TextStyle(color: kBlack),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SpaceWH(width: 30),
                                Text(
                                  "TO       :  ",
                                  style: textstyle(14, FontWeight.w400, kBlack),
                                ),
                                Text(
                                  "${dropOff.day} $dropOffMonth ${dropOff.year}",
                                  style: const TextStyle(color: kBlack),
                                ),
                              ],
                            ),
                            const SpaceWH(
                              height: 7,
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: UserBookingDetails(index: index),
                                type: PageTransitionType.bottomToTop,
                                duration: const Duration(
                                  milliseconds: 400,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 130,
                            height: 55,
                            decoration: const BoxDecoration(
                              gradient: specialCard2,
                              // color: kBlack,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Details",
                                style: textstyle(18, FontWeight.w500, kwhite),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 10,
              child: Image.network(
                provider.bookingList[index].carData![0].image!,
                width: 140,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
