// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/request/request.dart';
// import 'package:http/http.dart' as http;
//
// import '../helpers/pref_helpers.dart';
// import '../utils/app_constants.dart';
// import 'api_constants.dart';
//
//
//
//
//
// class ApiClient extends GetxService {
//   static var client = http.Client();
//
//   static const String noInternetMessage = "Can't connect to the internet!";
//   static const int timeoutInSeconds = 30;
//   static String bearerToken = "";
//
//
//
//   static Future<Response> getData(String uri, {Map<String,
//       dynamic>? query, Map<String, String>? headers}) async {
//      bearerToken = await PrefsHelper.getString(AppConstants.bearerToken);
//     var mainHeaders ={
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $bearerToken'
//     };
//     try {
//       debugPrint('====> API Call: $uri\nHeader: ${headers??mainHeaders}');
//       http.Response response = await client
//           .get(
//         Uri.parse(ApiConstants .baseUrl + uri),
//         headers: headers ?? mainHeaders,
//       )
//           .timeout(const Duration(seconds: timeoutInSeconds));
//       return handleResponse(response, uri);
//     } catch (e) {
//       debugPrint('------------${e.toString()}');
//       return const Response(statusCode: 1, statusText: noInternetMessage);
//     }
//   }
//
//
//   static Future<Response> postData(String uri, dynamic body,
//       {Map<String, String>? headers}) async {
//        bearerToken = await PrefsHelper.getString(AppConstants.bearerToken);
//
//
//     var mainHeaders ={
//       'Content-Type': 'application/x-www-form-urlencoded',
//    //   'Content-Type': 'application/json',
//       'Authorization': 'Bearer $bearerToken'
//     };
//     try {
//       debugPrint('====> API Call: $uri\nHeader: ${headers??mainHeaders}');
//       debugPrint('====> API Body: $body');
//
//       http.Response response = await client
//           .post(
//             Uri.parse(ApiConstants.baseUrl+uri),
//             body:body,
//
//
//
//
//
//
//
//
//   static Response handleResponse(http.Response response, String uri) {
//     dynamic body;
//     try {
//       body = jsonDecode(response.body);
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     Response response0 = Response(
//       body: body ?? response.body,
//       bodyString: response.body.toString(),
//       request: Request(
//           headers: response.request!.headers,
//           method: response.request!.method,
//           url: response.request!.url),
//       headers: response.headers,
//       statusCode: response.statusCode,
//       statusText: response.reasonPhrase,
//     );
//     if (response0.statusCode != 200 &&
//         response0.body != null &&
//         response0.body is !String) {
//         ErrorResponse errorResponse = ErrorResponse.fromJson(response0.body);
//         response0 = Response(statusCode: response0.statusCode, body: response0.body, statusText: errorResponse.message);
//
//
//     } else if (response0.statusCode != 200 && response0.body == null) {
//       response0 = const Response(statusCode: 0, statusText: noInternetMessage);
//     }
//
//     debugPrint(
//         '====> API Response: [${response0.statusCode}] $uri\n${response0.body}');
//     // log.e("Handle Response error} ");
//     return response0;
//   }
//
//
//
//
//
// }