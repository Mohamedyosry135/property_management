import 'package:property_managment/base/base_repositroy.dart';

import 'package:property_managment/pages/admin/add_tenant_owner/models/create_user_request.dart';
import 'package:property_managment/pages/admin/add_tenant_owner/models/create_user_response.dart';
import 'package:http/http.dart' as http;
import 'package:property_managment/pages/admin/delete_user/models/user_update_model.dart';
import 'delete_user_provider.dart';

abstract class IDeleteUserRepository {
  Future<http.Response> deleteUser(int id);
  Future<dynamic> updateUser(int id, UserUpdateModel userUpdateModel);

}

class DeleteUserRepository extends BaseRepository
    implements IDeleteUserRepository {
  DeleteUserRepository({required this.provider});

  final IDeleteUserProvider provider;

  @override
  Future<http.Response> deleteUser(int id) async {
    http.Response response = await provider.deleteUser(id);
    return response;
  }

  @override
  Future updateUser(int id, UserUpdateModel userUpdateModel)async{
    final apiResponse = await provider.updateUser(id,userUpdateModel);
    if(apiResponse != null && apiResponse ==200){
      return apiResponse;
    }else {
      throw(getErrorMessage("error")) ;
    }
  }
}
