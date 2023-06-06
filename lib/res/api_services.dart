import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:turbo_rent/res/api_status.dart';

class ApiServices {
  // POST METHOD
  static Future<Object> postMethod({
    required String url,
    required Map data,
    required BuildContext context,
    Function? function,
    Map<String, String>? headers,
  }) async {
    try {
      final response =
          await http.post(Uri.parse(url), body: data, headers: headers);
      log("+++++++++++${response.statusCode}++++++++++");
      log(response.body.toString());
      if (response.statusCode == 201 || response.statusCode == 200) {
        return Success(
            response: function == null ? null : function(response.body));
      }
      return Failures(
          code: response.statusCode, errrorResponse: "Invalid Response");
    } on HttpException {
      return Failures(code: 101, errrorResponse: "No Internet");
    } on FormatException {
      return Failures(code: 102, errrorResponse: "Invalid Format");
    } on SocketException catch (e) {
      log(e.toString());
      return Failures(code: 101, errrorResponse: "No Internet");
    } on TimeoutException {
      return Failures(code: 104, errrorResponse: "Time Out");
    } catch (e) {
      log(e.toString());

      return Failures(code: 500, errrorResponse: "UNKnown error");
    }
  }

  // GET METHOD
  static Future<Object> getMEthod({
    required String url,
    required Function function,
    Map<String, String>? headers,
  }) async {
    try {
      log("get function:22");
      final response = await http.get(Uri.parse(url), headers: headers);

      log("get function:33");

      log("******${response.statusCode}******");
      // log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("success");
        return Success(response: function(response.body));
      }
      log("failures");
      return Failures(
          code: response.statusCode, responseMsg: "Invalid response");
    } on HttpException {
      return Failures(code: 101, errrorResponse: "No Internet");
    } on FormatException {
      log('thissss error');
      return Failures(code: 102, errrorResponse: "Invalid Format");
    } on SocketException catch (e) {
      log(e.toString());
      return Failures(code: 101, errrorResponse: "No Internet");
    } on TimeoutException {
      return Failures(code: 104, errrorResponse: "Time Out");
    } catch (e) {
      log(e.toString());
      return Failures(code: 500, errrorResponse: "UNKnown error");
    }
  }
}
