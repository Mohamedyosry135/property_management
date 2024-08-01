


import 'package:get/get.dart';
import 'package:property_managment/base/base_repositroy.dart';
import 'package:property_managment/pages/common/login/models/login_response_model.dart';
import 'package:property_managment/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;

import 'login_api_provider.dart';
import 'package:http/http.dart' as http;
abstract class ILoginRepository {
  Future<LoginResponseModel> login(String email , String password) ;
}

class LoginRepository extends BaseRepository implements ILoginRepository {
  LoginRepository({required this.provider});
  final ILoginProvider provider;

  @override
  Future<LoginResponseModel> login(String userName, String password) async{

     final apiResponse = await provider.loginWithEmailAndPassword(userName, password) ;
     printInfo(info: apiResponse.bodyString!);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if(apiResponse.isOk && apiResponse.body != null){
      AuthService.to.login(apiResponse.body!);
      AuthService.to.userInfo =  apiResponse.body!;
      return apiResponse.body! ;
    }else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw(getErrorMessage(apiResponse.bodyString!)) ;
    }
  }
}
