


import 'package:get/get.dart';
import 'package:property_managment/base/base_repositroy.dart';
import 'package:property_managment/consts/response_base_model.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/pages/common/maintenance_requests/model/add_maintenance_request.dart';
import 'package:property_managment/pages/common/maintenance_requests/model/add_maintenance_response.dart';
import 'package:property_managment/pages/common/maintenance_requests/model/maintaenance_requests_model.dart';

import 'maintenance_requests_api_provider.dart';

abstract class IMaintenanceRequestsRepository {
  Future<MaintenanceRequestsModel> getMaintenanceRequests();
  Future<List<RealStatesModel>> getRealStates();
  Future<AddMaintenanceResponse> addMaintenanceRequest(AddMaintenanceRequest model) ;
  Future<AddMaintenanceResponse?> editMaintenanceRequest(AddMaintenanceRequest model,String id) ;

  Future<ResponseBaseModel?> deleteMaintenanceRequest(String id);

  Future<List<ContractModel>> getContracts();

  Future<List<Users>> getUsers();

}

class MaintenanceRequestsRepository extends BaseRepository implements IMaintenanceRequestsRepository {
  MaintenanceRequestsRepository({required this.provider});
  final IMaintenanceRequestsProvider provider;
  @override
  Future<MaintenanceRequestsModel> getMaintenanceRequests() async{
    final apiResponse = await provider.getMaintenanceRequests() ;
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

  @override
  Future<AddMaintenanceResponse> addMaintenanceRequest(AddMaintenanceRequest model) async{
    final apiResponse = await provider.addMaintenanceRequest(model);
    if(apiResponse != null ){
      return apiResponse;
    }else {
      throw(getErrorMessage("error")) ;
    }
  }

  @override
  Future<AddMaintenanceResponse?> editMaintenanceRequest(AddMaintenanceRequest model, String id) async{
    final apiResponse = await provider.editMaintenanceRequest(model,id);
    if(apiResponse != null){
      return apiResponse;
    }else {
      throw(getErrorMessage("error")) ;
    }
  }

  @override
  Future<ResponseBaseModel?> deleteMaintenanceRequest(String id) async{
    final apiResponse = await provider.deleteMaintenanceRequest(id);
    if(apiResponse != null && (apiResponse.status?.contains("success") ?? false)){
      return apiResponse;
    }else {
      throw(getErrorMessage(apiResponse?.status  ?? "error")) ;
    }
  }

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
}
