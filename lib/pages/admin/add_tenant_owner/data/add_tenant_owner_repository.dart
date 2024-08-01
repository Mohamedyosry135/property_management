import 'package:property_managment/base/base_repositroy.dart';


import 'package:property_managment/pages/admin/add_tenant_owner/models/create_user_request.dart';
import 'package:property_managment/pages/admin/add_tenant_owner/models/create_user_response.dart';


import 'add_tenant_owner_api_provider.dart';

abstract class IAddTenantOwnerRepository {
  Future<CreateUserResponse?> addUser(CreateUserRequest model);


}

class AddTenantOwnerRepository extends BaseRepository
    implements IAddTenantOwnerRepository {
  AddTenantOwnerRepository({required this.provider});

  final IAddTenantOwnerProvider provider;

  @override
  Future<CreateUserResponse?> addUser(CreateUserRequest model) async{
    final apiResponse = await provider.addUser(model);
    if(apiResponse != null ){
      return apiResponse;
    }else {
      throw(getErrorMessage("error")) ;
    }
  }

}
