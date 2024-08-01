// ignore: one_member_abstracts

import 'package:property_managment/base/api_end_points.dart';
import 'package:property_managment/base/base_auth_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:property_managment/pages/admin/add_tenant_owner/models/create_user_request.dart';
import 'package:property_managment/pages/admin/add_tenant_owner/models/create_user_response.dart';
import 'package:property_managment/pages/admin/delete_user/models/user_update_model.dart';

import '../../../../services/auth_service.dart';

abstract class IDeleteUserProvider {
  Future<http.Response> deleteUser(int id);
  Future<dynamic> updateUser(int id, UserUpdateModel userUpdateModel);

}

class DeleteUserProvider extends BaseAuthProvider
    implements IDeleteUserProvider {
  @override
  Future<http.Response> deleteUser(int id) async {
    http.Response response = await http.delete(
      Uri.parse('${EndPoints.baseUrl}${EndPoints.deleteRealEstateUser}$id'),
      headers: EndPoints.requestHeader
    );
    return response;
  }

  @override
  Future<dynamic> updateUser(int id, UserUpdateModel userUpdateModel) async{
    print("before request ${userUpdateModel.toJson()}");
    var response = await put(
      "${EndPoints.updateRealEstateUser}${id}",
      userUpdateModel.toJson(),
      // decoder: AddRealStateResponseModel.fromJson,
    );

    return response.statusCode;
  }
}
