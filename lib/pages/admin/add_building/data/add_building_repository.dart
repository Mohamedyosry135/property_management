


import 'package:get/get.dart';
import 'package:property_managment/base/base_repositroy.dart';
import 'package:property_managment/consts/response_base_model.dart';
import 'package:property_managment/pages/admin/add_building/model/add_real_state_response_model.dart';
import 'package:property_managment/pages/admin/add_building/model/create_real_state_model.dart';
import 'package:property_managment/pages/admin/create_contract/models/constants_lists.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';

import 'add_building_api_provider.dart';

abstract class IAddBuildingRepository {
  Future<bool> addRealState(CreateRealStateModel model) ;
  Future<bool?> editRealState(CreateRealStateModel model,String id) ;
  Future<ResponseBaseModel?> deleteRealState(String id) ;

  Future<List<Users>> getUsers();
  Future<ConstantsLists> getConstantsLists();

}

class AddBuildingRepository extends BaseRepository implements IAddBuildingRepository {
  AddBuildingRepository({required this.provider});
  final IAddBuildingProvider provider;

  @override
  Future<bool> addRealState(CreateRealStateModel model) async{
    final apiResponse = await provider.addRealState(model);
     if(apiResponse != null && apiResponse == 200){
      return true;
    }else {
      throw(getErrorMessage("error")) ;
    }
  }

  @override
  Future<bool> editRealState(CreateRealStateModel model,String id) async{
    final apiResponse = await provider.editRealState(model,id);
    if(apiResponse != null && apiResponse == 200){
      return true;
    }else {
      throw(getErrorMessage("error")) ;
    }
  }

  @override
  Future<ResponseBaseModel?> deleteRealState(String id) async{
    final apiResponse = await provider.deleteRealState(id);
    if(apiResponse != null && (apiResponse.status?.contains("success") ?? false)){
      return apiResponse;
    }else {
      throw(getErrorMessage(apiResponse?.status  ?? "error")) ;
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
  Future<ConstantsLists> getConstantsLists() async{
    final apiResponse = await provider.getConstantsLists() ;
    printInfo(info: apiResponse.toString());
    if(apiResponse != null){
      return apiResponse;
    }else {
      throw(getErrorMessage("Error")) ;
    }
  }

}
