import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbos_rent/components/common/common_appbar.dart';
import 'package:turbos_rent/utils/colors.dart';
import 'package:turbos_rent/utils/space_wh.dart';
import 'package:turbos_rent/utils/textstyle.dart';
import 'package:turbos_rent/view/payment/payment_varified.dart';
import '../../view_model/booking_view_model.dart';

const sharedKeyValue = 'Payment Successfull';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});
  @override
  State<PaymentDetails> createState() => _PaymentDetails();
}

class _PaymentDetails extends State<PaymentDetails> {
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _pinCode = TextEditingController();
  final TextEditingController _monthYear = TextEditingController();

  bool isdatamatched = true;
  final _formkey = GlobalKey<FormState>();
  var isHovered = false;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookingViewModel>().bookingDetail;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CommonAppbar(
          title: "Payment Process",
          txtClr: kBlack,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
          child: Form(
            key: _formkey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Text(
                  "CARD DETAILS FOR THE PAYMENT",
                  style: textstyle(17, FontWeight.w900, kBlack),
                  maxLines: 1,
                  overflow: null,
                ),
                const SpaceWH(
                  height: 80,
                ),
                Container(
                  alignment: Alignment.center,
                  // padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.credit_card,
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'Card Number',
                    ),
                    validator: (value) {
                      // if (isdatamatched) {
                      //   return null;
                      // } else {
                      //   return 'invalid username';
                      // }
                      if (value == null || value.isEmpty) {
                        return 'required';
                      } else {
                        return null;
                      }
                    },
                    controller: _cardNumber,
                  ),
                ),
                const SpaceWH(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  // padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    obscureText: true,
                    controller: _pinCode,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'CVC',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'required';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SpaceWH(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  // padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'MM/YY',
                    ),
                    validator: (value) {
                      // if (isdatamatched) {
                      //   return null;
                      // } else {
                      //   return 'invalid username';
                      // }
                      if (value == null || value.isEmpty) {
                        return 'required';
                      } else {
                        return null;
                      }
                    },
                    controller: _monthYear,
                  ),
                ),
                const SpaceWH(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      child: MouseRegion(
                        onEnter: (PointerEvent event) {
                          // Mouse pointer entered the button
                          setState(() {
                            // Update the state to trigger the hover effect
                            isHovered = true;
                          });
                        },
                        onExit: (PointerEvent event) {
                          // Mouse pointer exited the button
                          setState(() {
                            // Update the state to remove the hover effect
                            isHovered = false;
                          });
                        },
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              // Call the checking() method to perform the desired action
                              checking(context);
                            } else {
                              // Handle the case when the form validation fails
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  isHovered ? specialGreen : maincolor,
                              fixedSize: const Size(180, 50)),
                          child: Text(
                            "Pay ₹ ${provider?.totalAmount}",
                            style: textstyle(20, FontWeight.bold, kwhite),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checking(BuildContext ctx) async {
    const cardNumber = '123456789';
    // final _username = _nameofuser.text;
    // final _password = _passwordofuser.text;
    const cvc = '1234';
    const monthYear = '07/99';

    if (cardNumber == _cardNumber.text &&
        cvc == _pinCode.text &&
        monthYear == _monthYear.text) {
      //go to varified page
      final sharedprefs = await SharedPreferences.getInstance();
      sharedprefs.setBool(sharedKeyValue, true);

      setState(() {
        isdatamatched = true;
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: ((context) {
          return const PaymentVarified();
        })));
      });
    } else {
      const errorMessage = 'Something Went Wrong With Your Bank Account';
      // snackbar
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(errorMessage),
      ));

      setState(() {
        isdatamatched = false;
      });
    }
  }
}
