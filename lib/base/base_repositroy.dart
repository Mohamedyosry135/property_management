
import 'dart:convert';

import 'api_error_response.dart';


class BaseRepository  {

  String  getErrorMessage(String apiResponse) {
    final responseJson = const JsonDecoder().convert(apiResponse);
    ApiErrorResponse errorResponse = ApiErrorResponse.fromJson(responseJson);
    if(apiResponse.isNotEmpty) {
      print("BASE ${apiResponse}");
      return errorResponse.message! ;
    } else {
      print("BASE ${apiResponse}");

      return "Something went wrong please try again later" ;
    }
  }
}
