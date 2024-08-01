


import 'package:get/get.dart';
import 'package:property_managment/base/base_repositroy.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';

import 'representative_owners_tenants_api_provider.dart';

abstract class IRepresentativeOwnersTenantsRepository {
  Future<List<Users>> getUsers(String role);


}

class RepresentativeOwnersTenantsRepository extends BaseRepository implements IRepresentativeOwnersTenantsRepository {
  RepresentativeOwnersTenantsRepository({required this.provider});
  final IRepresentativeOwnersTenantsProvider provider;


  @override
  Future<List<Users>> getUsers(String role) async{
    final apiResponse = await provider.getUsers(role) ;
    printInfo(info: apiResponse.toString());
    if(apiResponse != null){
      return apiResponse;
    }else {
      throw(getErrorMessage("Error")) ;
    }
  }
}
