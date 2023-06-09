// import 'dart:async';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:turbo_rent/model/payment_model.dart';
// import 'package:turbo_rent/res/api_status.dart';
// import 'package:turbo_rent/utils/urls.dart';

// class PaymentViewModel extends ChangeNotifier {
//   Future<void> pay({required String amount, required context}) async {
//     // 1.
//     await fetchPaymentIntentClientSecret(amount, context);
//     // 2.
//     await initializePaymentSheet();
//     // 3.
//     await confirmPayment(context);
//   }

// // 1==================
//   fetchPaymentIntentClientSecret(String amount, context) async {
//     final url = Urls.payment;
//     Map<String, String> headers = {
//       'Authorization': 'Bearer ${Urls.secret}',
//       'Content-Type': 'application/x-www-form-urlencoded'
//     };

//     Map<String, dynamic> body = {
//       'amount': calculateAmount(amount),
//       'currency': "INR",
//       'payment_method_types[]': 'card',
//     };
//     final response = await ApiServices.postMethod(
//       context: context,
//       url: url,
//       data: body,
//       headers: headers,
//       function: paymentModelFromJson,
//     );
//     if (response is Success) {
//       if (response.response != null) {
//         _paymentModel = response.response as PaymentModel;
//       }
//     }
//     if (response is Failures) {
//       Errors errors = Errors(
//         code: response.code,
//         message: response.errrorResponse,
//       );
//       setError(errors, context);
//     }
//   }
// // 2================

//   Future<void> initializePaymentSheet() async {
//     const billingdetails = BillingDetails(
//       name: "John Doe",
//       email: "john.doe@example.com",
//       phone: "+919876543210",
//       address: Address(
//           city: "Mumbai",
//           country: "IN",
//           line1: "123 Main St",
//           line2: "Apartment 4B",
//           postalCode: "400001",
//           state: "Maharashtra"),
//     );


//     await Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         paymentIntentClientSecret: _paymentModel!.clientSecret,
//         billingDetails: billingdetails,
//         merchantDisplayName: "Ijas",
//         // customFlow: true,
//         style: ThemeMode.light,
//       ),
//     );
//   }

// // 3================
//   confirmPayment(BuildContext context) async {
//     try {
//       await Stripe.instance.presentPaymentSheet();

//       // ignore: use_build_context_synchronously
//       Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const HomeScreen(),
//           ),
//           (route) => false);
//       // ignore: use_build_context_synchronously
//       CommonSnackBAr.snackBar(
//           context: context,
//           data: "payment sucessfully completed",
//           color: specialGreen);
//     } on Exception catch (e) {
//       if (e is StripeException) {
//         log("Error from Stipe: ${e.error.localizedMessage}");
//         CommonSnackBAr.snackBar(
//             context: context,
//             data: "Error from Stipe: ${e.error.localizedMessage}",
//             color: snackbarRed);
//       } else {
//         log("Unforseen Error");
//         CommonSnackBAr.snackBar(
//             context: context, data: "Unforseen Error", color: snackbarRed);
//       }
//     }
//   }

//   setError(Errors error, context) async {
//     _errors = error;
//     return errorResponses(_errors!, context);
//   }

//   setLoading(bool isLoad) {
//     _isLoading = isLoad;
//     notifyListeners();
//   }

//   //GET THE ACCESSTOKEN
//   Future<String?> getAccessToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     final accessToken = prefs.getString("ACCESS_TOKEN");
//     return accessToken;
//   }

//   setPaymentModel(PaymentModel? paymentModel) {
//     _paymentModel = paymentModel;
//     notifyListeners();
//   }

//   Future<void> payAmount({
//     required String amount,
//     required String bookingId,
//     required BuildContext context,
//   }) async {
//     try {
//       log("1111111111111111111");

//       await createPaymentIntent(amount: amount, context: context);

//       // log(_paymentModel!.clientSecret.toString());
//       const billingdetails = BillingDetails(
//         name: "John Doe",
//         email: "john.doe@example.com",
//         phone: "+919876543210",
//         address: Address(
//             city: "Mumbai",
//             country: "IN",
//             line1: "123 Main St",
//             line2: "Apartment 4B",
//             postalCode: "400001",
//             state: "Maharashtra"),
//       );

//       await Stripe.instance
//           .initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//             paymentIntentClientSecret: _paymentModel!.clientSecret,
//             style: ThemeMode.dark,
//             billingDetails: billingdetails,
//             merchantDisplayName: "Ijas"),
//       )
//           .then((value) {
//         displayPaymentSheet(
//             amount: amount, context: context, bookingId: bookingId);
//       });
//     } catch (e) {
//       log("BBBBBBBB");
//       log(e.toString());
//     }
//   }

//   createPaymentIntent(
//       {required String amount, required BuildContext context}) async {
//     log("aaaaaaaa");
//     setLoading(true);

//     Map<String, String> headers = {
//       'Authorization': 'Bearer ${Urls.secret}',
//       'Content-Type': 'application/x-www-form-urlencoded'
//     };

//     Map<String, dynamic> body = {
//       'amount': calculateAmount(amount),
//       'currency': "INR",
//       'payment_method_types[]': 'card',
//       'receipt_email': 'ija@gamil.com'
//     };
//     String url = Urls.payment;
//     final response = await ApiServices.postMethod(
//       context: context,
//       url: url,
//       data: body,
//       headers: headers,
//       function: paymentModelFromJson,
//     );
//     log("OOOOOOOOOOOOOOOOOOOOOOOOOO");
//     if (response is Success) {
//       if (response.response != null) {
//         // return response.response;
//         log("--------------------------------");
//         _paymentModel = response.response as PaymentModel;
//         log("ppppppppppppppppppppppp");
//       }
//     }
//     if (response is Failures) {
//       setLoading(false);
//       log("=+++++++++++++++++++++++++++++++++++++");
//       Errors error = Errors(
//         code: response.code,
//         message: response.responseMsg,
//       );
//       // ignore: use_build_context_synchronously
//       await setError(error, context);
//     }

//     setLoading(false);
//   }

//   displayPaymentSheet(
//       {required BuildContext context,
//       required String amount,
//       required String bookingId}) async {
//     try {
//       await Stripe.instance.presentPaymentSheet().then((value) {
//         paymentToBackend(
//             bookingId: bookingId, totalAmount: amount, context: context);

//         // _paymentModel = null;
//       }).onError((error, stackTrace) {
//         log("Error is :---> $error $stackTrace");
//       });
//     } on StripeException catch (e) {
//       log("Error is :---> $e");
//       showDialog(
//         context: context,
//         builder: (_) => const AlertDialog(
//           content: Text("Cancelled"),
//         ),
//       );
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   calculateAmount(String amount) {
//     final calculatedAmount = (int.parse(amount)) * 100;
//     return calculatedAmount.toString();
//   }

//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   Errors? _errors;
//   Errors? get errors => _errors;

//   PaymentModel? _paymentModel;
//   PaymentModel? get paymentModel => _paymentModel;

//   errorResponses(Errors error, BuildContext context) {
//     final statusCode = error.code;

//     if (statusCode == 400 || statusCode == 401) {
//       return CommonSnackBAr.snackBar(
//           context: context, data: "Something happened", color: snackbarRed);
//     }
//     return CommonSnackBAr.snackBar(
//       context: context,
//       data: "No internet connection",
//       color: snackbarRed,
//     );
//   }

//   paymentToBackend(
//       {required String bookingId,
//       required String totalAmount,
//       required context}) async {
//     log("!@#%^&$_paymentModel");
//     final url = Urls.baseUrl + Urls.user + Urls.userPayment;
//     final accessToken = await getAccessToken();
//     var headers = {"authorization": "Bearer $accessToken"};
//     log(_paymentModel!.toJson().toString());
//     Map<String, dynamic> body = {
//       "bookingId": bookingId,
//       "token": _paymentModel!.toJson().toString(),
//     };
//     final response = await ApiServices.postMethod(
//       context: context,
//       url: url,
//       data: body,
//       headers: headers,
//     );

//     if (response is Success) {
//       log(response.response.toString());
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   children: const [
//                     Icon(
//                       Icons.check_circle,
//                       color: Colors.green,
//                     ),
//                     Text("Payment Successfull"),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     }
//     if (response is Failures) {
//       log(response.responseMsg.toString());
//     }
//   }
// }

// class Errors {
//   int? code;
//   Object? message;

//   Errors({
//     this.code,
//     this.message,
//   });
// }
