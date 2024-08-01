// ignore: one_member_abstracts

import 'package:property_managment/base/api_end_points.dart';
import 'package:property_managment/base/base_auth_provider.dart';
import 'package:get/get.dart';
import 'package:property_managment/pages/common/support/models/support_response.dart';
import 'package:property_managment/services/auth_service.dart';


abstract class ISupportProvider {
  Future<Response<SupportResponseMessage>> addMessageSupport(String message);


}

class SupportProvider extends BaseAuthProvider implements ISupportProvider {
  @override
  Future<Response<SupportResponseMessage>> addMessageSupport(String message) async{
    var response = await post(
      EndPoints.sendMessageSupport,
      {
        "name": AuthService.to.userInfo?.result?.data?.name ??"",
        "email": AuthService.to.userInfo?.result?.data?.email ??"",
        "message": message
      },
      decoder: SupportResponseMessage.fromJson,
    );
    return response;
  }

}
