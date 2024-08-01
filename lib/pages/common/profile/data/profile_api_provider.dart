// ignore: one_member_abstracts

import 'package:property_managment/base/base_auth_provider.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart' as http;
import 'package:property_managment/pages/common/login/models/login_response_model.dart';
import 'package:property_managment/pages/common/profile/models/update_profile_model.dart';

import '../../../../base/api_end_points.dart';
import '../../../../services/auth_service.dart';

abstract class IProfileProvider {
  Future<http.Response> fetchProfileData();
  Future<UpdateProfile> editProfile(String mail,String phone, String name,int id,String password);

}

class ProfileProvider extends BaseAuthProvider implements IProfileProvider {
  @override
  Future<http.Response> fetchProfileData() async {
    print("${EndPoints.baseUrl}${EndPoints.profileData}/${AuthService.to.userInfo?.result?.data?.id}");
    http.Response response = await http.get(
      Uri.parse("${EndPoints.baseUrl}${EndPoints.profileData}/${AuthService.to.userInfo?.result?.data?.id}"),
      headers: EndPoints.requestHeader
    );
    return response;
  }

  @override
  Future<UpdateProfile> editProfile(String mail, String phone, String name,int id,String password)async {
    var response = await put(
      "${EndPoints.updateRealEstateUser}${id}",
      password.isEmpty ? {
        "name": name,
        "email": mail,
        "phone":phone,
      } : {
        "name": name,
        "email": mail,
        "phone":phone,
        "password" : password
      }
      ,
      decoder: UpdateProfile.fromJson,
    );
    return response.body ??UpdateProfile();
  }
}
