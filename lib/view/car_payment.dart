import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:turbo_rent/components/common/common_button.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/space_wh.dart';
import 'package:turbo_rent/utils/textstyle.dart';
import 'package:turbo_rent/view_model/booking_view_model.dart';

class CarPaymentScreen extends StatefulWidget {
  const CarPaymentScreen({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<CarPaymentScreen> createState() => _CarPaymentScreenState();
}

class _CarPaymentScreenState extends State<CarPaymentScreen> {
  Map<String, dynamic>? paymentIntents;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookingViewModel>().bookingDetail;
    final size = MediaQuery.of(context).size;
    // final payment = Provider.of<PaymentViewModel>(context);
    DateTime pick = DateTime.parse(provider!.bookedSlots!.from.toString());
    String pickUp = DateFormat.MMM().format(pick);

    DateTime drop = DateTime.parse(provider.bookedSlots!.to.toString());
    String dropOff = DateFormat.MMM().format(drop);

    return Scaffold(
      appBar: AppBar(
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
                      "Are you sure do you want to close the payment section?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.pop(context);
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
          "Payment Section",
          style: textstyle(18, FontWeight.w500, kBlack),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SpaceWH(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                height: 200,
                child: Image.asset("assets/images/carlogo.png"),
              ),
              const SpaceWH(height: 20),
              SizedBox(
                width: size.width * 0.77,
                height: size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "FROM",
                          style: textstyle(15, FontWeight.normal, kBlack),
                        ),
                        Text(
                          "${pick.day} $pickUp ${pick.year}",
                        ),
                      ],
                    ),
                    const SpaceWH(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TO",
                          style: textstyle(15, FontWeight.normal, kBlack),
                        ),
                        Text(
                          "${drop.day} $dropOff ${drop.year}",
                        ),
                      ],
                    ),
                    const SpaceWH(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "DROP OFF CITY",
                          style: textstyle(15, FontWeight.normal, kBlack),
                        ),
                        Text("${provider.dropoffCity}"),
                      ],
                    ),
                    const SpaceWH(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "BOOKING STATUS",
                          style: textstyle(15, FontWeight.normal, kBlack),
                        ),
                        Text("${provider.transactionId}"),
                      ],
                    ),
                    const SpaceWH(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOTAL HOURS",
                          style: textstyle(15, FontWeight.normal, kBlack),
                        ),
                        Text("${provider.totalHours}"),
                      ],
                    ),
                    const SpaceWH(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOTAL AMOUNT",
                          style: textstyle(15, FontWeight.bold, kBlack),
                        ),
                        Text(
                          "${provider.totalAmount}",
                          style: textstyle(14, FontWeight.bold, kBlack),
                        ),
                      ],
                    ),
                    const SpaceWH(
                      height: 30,
                    ),
                    CommonButton(
                      onTap: () {
                        log('${provider.transactionId}');

                        // payment.pay(
                        //     amount: provider.totalAmount.toString(),
                        //     context: context);
                      },
                      color: maincolor,
                      child: const Text(
                        "PAY NOW",
                        style: TextStyle(color: kwhite),
                      ),
                    ),
                  ],
                ),
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     payment.payAmount(
              //         amount: provider.totalAmount.toString(),
              //         bookingId: provider.id.toString(),
              //         context: context);
              //   },
              //   child: const Text("Backend"),
              // ),

              // ElevatedButton(
              //   onPressed: () async {
              //     var items = [
              //       {
              //         "productPrice": 4,
              //         "productName": "Apple",
              //         "qty": 5,
              //       },
              //       {
              //         "productPrice": 5,
              //         "productName": "Pineapple",
              //         "qty": 10,
              //       },
              //     ];
              //     await PaymentsViewModel.stripePaymentCheckout(
              //       items,
              //       500,
              //       context,
              //       mounted,
              //       onSuccess: () {
              //         log("SUCCESS");
              //       },
              //       onCancel: () {
              //         log("CANCEL");
              //       },
              //       onError: (e) {
              //         log("ERROR:$e");
              //       },
              //     );
              //   },
              //   child: const Text("checkout stripe"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
