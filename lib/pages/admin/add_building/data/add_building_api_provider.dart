// ignore: one_member_abstracts

import 'dart:convert';

import 'package:property_managment/base/api_end_points.dart';
import 'package:property_managment/base/base_auth_provider.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/response_base_model.dart';
import 'package:property_managment/pages/admin/add_building/model/add_real_state_response_model.dart';
import 'package:property_managment/pages/admin/add_building/model/create_real_state_model.dart';
import 'package:http/http.dart' as http;
import 'package:property_managment/pages/admin/create_contract/models/constants_lists.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/services/auth_service.dart';

abstract class IAddBuildingProvider {
  Future<dynamic> addRealState(CreateRealStateModel model);
  Future<dynamic?> editRealState(CreateRealStateModel model,String id);
  Future<ResponseBaseModel?> deleteRealState(String id);
  Future<List<Users>> getUsers();
  Future<ConstantsLists> getConstantsLists();

}

class AddBuildingProvider extends BaseAuthProvider implements IAddBuildingProvider {

  @override
  Future<dynamic> addRealState(CreateRealStateModel model) async{

    print("CreateRealStateModelCreateRealStateModel ${model.toJson()}");
    var response = await post(
      EndPoints.addRealState,
      model.toJson(),
      // decoder: AddRealStateResponseModel.fromJson,
    );
    return response.statusCode;
  }

  @override
  Future<dynamic> editRealState(CreateRealStateModel model,String id) async{
    print("before request ${model.toJson()}");
    var response = await put(
      "${EndPoints.getRealStates}/${id}",
      model.toJson(),
      // decoder: AddRealStateResponseModel.fromJson,
    );
    return response.statusCode;
  }

  @override
  Future<ResponseBaseModel?> deleteRealState(String id) async{
    var response = await http.delete(
      Uri.parse(
        "${EndPoints.baseUrl}${EndPoints.getRealStates}/${id}"
      ),
      headers: EndPoints.requestHeader
    );
    return ResponseBaseModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<Users>> getUsers() async {
    var response = await http.get(
        Uri.parse("${EndPoints.baseUrl}${EndPoints.getRealstateUsers}?role=owner"),
        headers: EndPoints.requestHeader
    );
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((item) => Users.fromJson(item)).toList();
  }
  @override
  Future<ConstantsLists> getConstantsLists()async {
    var response = await http.get(
      Uri.parse("${EndPoints.baseUrl}${EndPoints.getConstantsList}"),
      headers: EndPoints.requestHeader,
    );
    print("dsa ${response.body}");
    Map<String, dynamic> varResp = jsonDecode(response.body);
    return ConstantsLists.fromJson(varResp);
  }

}
