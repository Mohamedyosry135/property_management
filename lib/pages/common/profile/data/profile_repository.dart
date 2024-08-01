import 'package:http/http.dart' as http;
import 'package:property_managment/base/base_repositroy.dart';
import 'package:property_managment/pages/common/login/models/login_response_model.dart';
import 'package:property_managment/pages/common/profile/models/update_profile_model.dart';
import 'package:property_managment/services/auth_service.dart';

import 'profile_api_provider.dart';

abstract class IProfileRepository {
  Future<http.Response> fetchProfile();
  Future<UpdateProfile> editProfile(String mail,String phone, String name,int id,String password);

}

class ProfileRepository extends BaseRepository implements IProfileRepository {
  ProfileRepository({required this.provider});
  final IProfileProvider provider;

  @override
  Future<http.Response> fetchProfile() async {
    http.Response response = await provider.fetchProfileData();
    return response;
  }

  @override
  Future <UpdateProfile>editProfile(String mail, String phone, String name,int id,String password) async{
    final apiResponse = await provider.editProfile(mail,phone,name,id,password);
    if(apiResponse != UpdateProfile()){

      AuthService.to.updateProfile(apiResponse);
      return apiResponse;
    }else {
      throw(getErrorMessage("error")) ;
    }
  }
}
