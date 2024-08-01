


import 'package:get/get.dart';
import 'package:property_managment/base/base_repositroy.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';

import 'admins_api_provider.dart';

abstract class IAdminsRepository {
  // Future<List<Users>> getRealstateUsers() ;
  Future<List<Users>> getUsers(String role);


}

class AdminsRepository extends BaseRepository implements IAdminsRepository {
  AdminsRepository({required this.provider});
  final IAdminsProvider provider;

  // @override
  // Future<List<Users>> getRealstateUsers() async{
  //   final apiResponse = await provider.getRealstateUsers() ;
  //   printInfo(info: apiResponse.bodyString!);
  //   print("apiResponse.isOk ${apiResponse.isOk}");
  //   if(apiResponse.isOk && apiResponse.body != null){
  //     return apiResponse.body! ;
  //   }else {
  //     print("apiResponse.body!.msg ${apiResponse.bodyString}");
  //     throw(getErrorMessage(apiResponse.bodyString!)) ;
  //   }
  // }

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
