// ignore: one_member_abstracts

import 'package:property_managment/base/api_end_points.dart';
import 'package:property_managment/base/base_auth_provider.dart';
import 'package:get/get.dart';
import 'package:property_managment/pages/admin/add_tenant_owner/models/create_user_request.dart';
import 'package:property_managment/pages/admin/add_tenant_owner/models/create_user_response.dart';


abstract class IAddRepresentativeTenantOwnerProvider {
  Future<CreateUserResponse?> addUser(CreateUserRequest model);


}

class AddRepresentativeTenantOwnerProvider extends BaseAuthProvider implements IAddRepresentativeTenantOwnerProvider {
  @override
  Future<CreateUserResponse?> addUser(CreateUserRequest model) async{
    print("sadasd ${model.toJson()}");

    var response = await post(
      EndPoints.userCreate,
      model.toJson(),
      decoder: CreateUserResponse.fromJson,
    );
    return response.body;
  }

}
