import 'dart:convert';
import 'package:acs_task/models/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:acs_task/utils/utility.dart';

class LoginRepository with Utility {

  Future<LoginResponse> login(String userName, String password) async {
    String url = 'http://94.127.213.184:45/Users/LogIn';
    log(jsonEncode({"Username": userName, "OldPassword": password}));
    var _response;
    LoginResponse apiResponse = LoginResponse(
      errorMessage: 'حدث خطأ ما يرجى المحاولة لاحقا',
    );
    try {
      _response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"Username": userName, "OldPassword": password}),
      );
      log('__________________________________________');
      log(_response.request!.url.toString());
      log(_response.body);
      log('__________________________________________');
      apiResponse = LoginResponse.fromJson(checkAndReturnResponse(_response));
      return apiResponse;
    } catch (error) {
      errorLog('getMapData Exception Error : ${error.toString()}');
      return apiResponse;
    }
  }
}
