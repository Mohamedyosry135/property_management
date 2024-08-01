// ignore: one_member_abstracts

import 'package:property_managment/base/api_end_points.dart';
import 'package:property_managment/base/base_auth_provider.dart';
import 'package:get/get.dart';
import 'package:property_managment/pages/common/login/models/login_response_model.dart';
import 'package:http/http.dart' as http;

abstract class ILoginProvider {

  Future<Response<LoginResponseModel>> loginWithEmailAndPassword(
      String email, String password);
}

class LoginProvider extends BaseAuthProvider implements ILoginProvider {

  @override
  Future<Response<LoginResponseModel>> loginWithEmailAndPassword(
      String email, String password) async{
    try{
      Response<LoginResponseModel> resp = await post<LoginResponseModel>(
        EndPoints.loginEndPoint,
        {
          "email": email,
          "password": password,
        },
        decoder: LoginResponseModel.fromJson,
      );

      print("resp.bodyString ${resp.bodyString}");
      return resp;
    }catch(e){
      throw(e);
    }

  }
}
