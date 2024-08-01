// ignore: one_member_abstracts

import 'dart:convert';

import 'package:property_managment/base/api_end_points.dart';
import 'package:property_managment/base/base_auth_provider.dart';
import 'package:get/get.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:http/http.dart' as http;
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';


abstract class IHomeTenantOwnerProvider {
  Future<List<ContractModel>> getContracts();
  Future<List<Users>> getUsers();
  Future<List<RealStatesModel>> getRealStates();


}

class HomeTenantOwnerProvider extends BaseAuthProvider implements IHomeTenantOwnerProvider {

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
}
