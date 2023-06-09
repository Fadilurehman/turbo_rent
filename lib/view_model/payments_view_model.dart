// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import 'package:turbo_rent/utils/urls.dart';


// class PaymentsViewModel {
//   // Backend
//   // String publishableKey =
//   //     "pk_test_51Mg3gFSFAwfsuLHcJkrQ5LqsAaNZjnbuQm0nVRjnRZN0qRtWcxZY1BBH18v94drHf15G2fCbTRb6PMr0f4CXmvKE00JRka5zhs";
//   // Mine
//   static String publishableKey =
//       "pk_test_51N3uIVSEurDXAlrNIzE0G5gxEG7wWQXH3eCofs75Qcb4P6CTI8NZFFtuGN4JDon7BWA9IN9RT4lrkSlQhFlHihWw00FbLfPSnn";

//   static Future<dynamic> createCheckoutSession(
//     List<dynamic> productItem,
//     totalAmount,
//   ) async {
//     final url = Uri.parse("https://api.stripe.com/v1/checkout/sessions");
//     String lineItems = '';
//     int index = 0;

//     for (var val in productItem) {
//       int productPrice = (val["productPrice"] * 100.round());
      
//       lineItems += "&line_items[$index][price_data][product_data][name]=${val['productName']}";
//       lineItems += "&line_items[$index][price_data][unit_amount]=$productPrice";
//       lineItems += "&line_items[$index][price_data][currency]=INR";
//       lineItems += "&line_items[$index][quantity]=${val['qty'].toString()}";

//       index++;
//     }

//     final response = await http.post(
//       url,
//       body:
//           "success_url=https://checkout.stripe.dev/success&mode=payment$lineItems",
//       headers: {
//         "Authorization": "Bearer ${Urls.secret}",
//         'Content-Type': 'application/x-www-form-urlencoded'
//       },
//     );
//     log(response.body);
//     return json.decode(response.body)["id"];
//   }

//   static Future<dynamic> stripePaymentCheckout(
//     productItems,
//     subtotal,
//     context,
//     mounted, {
//     onSuccess,
//     onCancel,
//     onError,
//   }) async {
//     final String sessionId =
//         await createCheckoutSession(productItems, subtotal);

//     final result = await redirectToCheckout(
//       context: context,
//       sessionId: sessionId,
//       publishableKey: publishableKey,
//       successUrl: "https://checkout.stripe.dev/success",
//       canceledUrl: "https://checkout.stripe.dev/cancel",
//     );
//     if (mounted) {
//       final text = result.when(
//         redirected: () => 'Redirected Successfuly',
//         success: () => onSuccess(),
//         canceled: () => onCancel(),
//         error: (e) => onError(e),
//       );
//       return text;
//     }
//   }
// }
