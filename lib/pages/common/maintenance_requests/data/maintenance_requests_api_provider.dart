// ignore: one_member_abstracts

import 'dart:convert';

import 'package:property_managment/base/api_end_points.dart';
import 'package:property_managment/base/base_auth_provider.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/response_base_model.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/pages/common/maintenance_requests/model/add_maintenance_request.dart';
import 'package:property_managment/pages/common/maintenance_requests/model/add_maintenance_response.dart';
import 'package:property_managment/pages/common/maintenance_requests/model/maintaenance_requests_model.dart';
import 'package:http/http.dart' as http;


abstract class IMaintenanceRequestsProvider {
  Future<MaintenanceRequestsModel> getMaintenanceRequests();
  Future<List<RealStatesModel>> getRealStates();
  Future<AddMaintenanceResponse?> addMaintenanceRequest(AddMaintenanceRequest model);
  Future<AddMaintenanceResponse?> editMaintenanceRequest(AddMaintenanceRequest model,String id);
  Future<ResponseBaseModel?> deleteMaintenanceRequest(String id);

  Future<List<ContractModel>> getContracts();
  Future<List<Users>> getUsers();

}

class MaintenanceRequestsProvider extends BaseAuthProvider implements IMaintenanceRequestsProvider {
  @override
  Future<MaintenanceRequestsModel> getMaintenanceRequests() async {

    print("EndPoints ${EndPoints.baseUrl + EndPoints.maintenanceRequests}");
    var response = await http.get(
      Uri.parse(EndPoints.baseUrl + EndPoints.maintenanceRequests),
      headers: EndPoints.requestHeader

    );

    return MaintenanceRequestsModel.fromJson(jsonDecode(response.body));

       // MaintenanceRequestsModel.fromJson(json.decode(response.body));
  }
  @override
  Future<List<Users>> getUsers() async {
    var response = await http.get(
        Uri.parse("${EndPoints.baseUrl}${EndPoints.getRealstateUsers}"),
        headers: EndPoints.requestHeader
    );
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((item) => Users.fromJson(item)).toList();
  }

  @override
  Future<List<RealStatesModel>> getRealStates() async {
     var response = await http.get(
      Uri.parse("${EndPoints.baseUrl}${EndPoints.getRealStates}"),
      headers: EndPoints.requestHeader

     );
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((item) => RealStatesModel.fromJson(item)).toList();
  }

  @override
  Future<AddMaintenanceResponse?> addMaintenanceRequest(AddMaintenanceRequest model) async{
    var response = await post(
      EndPoints.maintenanceRequests,
      model.toJson(),
      decoder: AddMaintenanceResponse.fromJson,
    );
    return response.body;
  }

  @override
  Future<AddMaintenanceResponse?> editMaintenanceRequest(AddMaintenanceRequest model,String id) async{
    var response = await put<AddMaintenanceResponse>(
      "${EndPoints.maintenanceRequests}/${id}",
      model.toJson(),
      decoder: AddMaintenanceResponse.fromJson,
    );
    return response.body;
  }

  @override
  Future<ResponseBaseModel?> deleteMaintenanceRequest(String id) async{
    var response = await http.delete(
      Uri.parse("${EndPoints.baseUrl}${EndPoints.maintenanceRequests}/${id}"),
      headers: EndPoints.requestHeader

    );
    return ResponseBaseModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<ContractModel>> getContracts()async{
    var response = await http.get(
        Uri.parse("${EndPoints.baseUrl}${EndPoints.getAllContracts}"),
        headers: EndPoints.requestHeader
    );
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((item) => ContractModel.fromJson(item)).toList();
    // return ContractModel.fromJson(json.decode(response.body));
  }
}
