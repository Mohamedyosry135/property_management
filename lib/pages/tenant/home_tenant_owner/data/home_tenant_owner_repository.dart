


import 'package:get/get.dart';
import 'package:property_managment/base/base_repositroy.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';

import 'home_tenant_owner_api_provider.dart';

abstract class IHomeTenantOwnerRepository {
  Future<List<ContractModel>> getContracts();
  Future<List<Users>> getUsers();
  Future<List<RealStatesModel>> getRealStates() ;


}

class HomeTenantOwnerRepository extends BaseRepository implements IHomeTenantOwnerRepository {
  HomeTenantOwnerRepository({required this.provider});
  final IHomeTenantOwnerProvider provider;

  @override
  Future<List<ContractModel>> getContracts() async{
    final apiResponse = await provider.getContracts() ;
    printInfo(info: apiResponse.toString());
    if(apiResponse != null){
      return apiResponse;
    }else {
      throw(getErrorMessage("Error")) ;
    }
  }
  @override
  Future<List<Users>> getUsers() async{
    final apiResponse = await provider.getUsers() ;
    printInfo(info: apiResponse.toString());
    if(apiResponse != null){
      return apiResponse;
    }else {
      throw(getErrorMessage("Error")) ;
    }
  }

  @override
  Future<List<RealStatesModel>> getRealStates() async{
    final apiResponse = await provider.getRealStates() ;
    printInfo(info: apiResponse.toString());
    if(apiResponse != null){
      return apiResponse;
    }else {
      throw(getErrorMessage("Error")) ;
    }
  }
}
