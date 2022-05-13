// import 'dart:convert';
//
// import 'package:acs_task/network/network_exception.dart';
// import 'package:acs_task/utils/utility.dart';
// import 'package:http/http.dart';
//
// class Network with Utility {
//
//
//
//   dynamic returnResponse(Response response) {
//     switch (response.statusCode) {
//       case 200:
//         final responseJson = json.decode(response.body);
//         log('$responseJson');
//         return responseJson;
//       case 400:
//         throw BadRequestException(response.body.toString());
//       case 401:
//       case 403:
//         throw UnauthorisedException(response.body.toString());
//       case 500:
//       default:
//         throw FetchDataException(
//             'Error occurred while Communication with Server with StatusCode : '
//                 '${response.statusCode}');
//     }
//   }
// }