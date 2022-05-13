import 'dart:convert';

import 'package:acs_task/network/network_exception.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

mixin Utility {
  final String apiUrl = 'http://94.127.213.184:45/Users/';

  dynamic checkAndReturnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = json.decode(response.body);
        log('$responseJson');
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : '
            '${response.statusCode}');
    }
  }

  Future<bool> checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // connected
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      // not connected
      return false;
    } else {
      return false;
    }
  }

  void errorLog(String? error) {
    final Logger logger = Logger();
    logger.e(error.toString());
  }

  void log(String msg) {
    final Logger logger = Logger();
    logger.i(msg);
  }
}
