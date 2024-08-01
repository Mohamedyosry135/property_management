// ignore: one_member_abstracts

import 'dart:convert';

import 'package:property_managment/base/api_end_points.dart';
import 'package:property_managment/base/base_auth_provider.dart';
import 'package:get/get.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/create_contract/models/constants_lists.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_payment_request.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_payment_response.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_request.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_response.dart';
import 'package:property_managment/pages/admin/create_contract/models/financial_request.dart';
import 'package:property_managment/pages/admin/create_contract/models/financial_response.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';

import 'package:http/http.dart' as http;

abstract class ICreateContractProvider {
  Future<FinanicalResponse?> createFinancial(FinanicalRequest model);
  Future<ContractResponse?> createContract(ContractRequest model);
  Future<ContractPaymentResponse?> creatPaymentContract(PaymentsRequest model);
  Future<List<Users>> getRealstateUsers(String role);
  Future<List<RealStatesModel>> getRealStates();
  Future<ConstantsLists> getConstantsLists();


}

class CreateContractProvider extends BaseAuthProvider implements ICreateContractProvider {
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
  Future<FinanicalResponse?> createFinancial(FinanicalRequest model) async{
    var response = await post(
      EndPoints.financial,
      model.toJson(),
      decoder: FinanicalResponse.fromJson,
    );
    return response.body;
  }

  @override
  Future<ContractPaymentResponse?> creatPaymentContract(PaymentsRequest model) async{
    var response = await post(
     EndPoints.createPayment,
      model.toJson(),
      decoder: ContractPaymentResponse.fromJson,
    );
    return response.body;
  }

  @override
  Future<ContractResponse?> createContract(ContractRequest model) async{
    print("MODEL ${model.toJson()}");
    var response = await post(
      EndPoints.createContract,
      model.toJson(),
      decoder: ContractResponse.fromJson,
    );
        print("response.body ${response.body!.toJson()}");

    return response.body;
  }
  @override
  Future<List<Users>> getRealstateUsers(String role) async {
    var response = await http.get(
        Uri.parse("${EndPoints.baseUrl}${EndPoints.getRealstateUsers}?role=${role}"),
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
