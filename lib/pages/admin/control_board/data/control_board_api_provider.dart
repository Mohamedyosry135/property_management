// ignore: one_member_abstracts

import 'dart:convert';

import 'package:get/get.dart';
  import 'package:http/http.dart' as http;
import 'package:property_managment/base/api_end_points.dart';
import 'package:property_managment/base/base_auth_provider.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:property_managment/pages/admin/create_contract/models/constants_lists.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/services/auth_service.dart';

abstract class IControlBoardProvider {
  Future<List<ContractModel>> getContracts();
  Future<List<Users>> getUsers();
  Future<List<RealStatesModel>> getRealStates();
  Future<ConstantsLists> getConstantsLists();

}

class ControlBoardProvider extends BaseAuthProvider
    implements IControlBoardProvider {


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
        Uri.parse(EndPoints.baseUrl + EndPoints.getRealStates),
        headers: EndPoints.requestHeader
    );
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((item) => RealStatesModel.fromJson(item)).toList();
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
