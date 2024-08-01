// ignore: one_member_abstracts

import 'dart:convert';

import 'package:property_managment/base/api_end_points.dart';
import 'package:property_managment/base/base_auth_provider.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/response_base_model.dart';
import 'package:property_managment/pages/admin/bond_preview/models/contract_payments_bond_model.dart';
import 'package:http/http.dart' as http;
import 'package:property_managment/pages/admin/bond_preview/models/financial_data_model.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:property_managment/pages/admin/create_contract/models/constants_lists.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_payment_request.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_payment_response.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_request.dart';
import 'package:property_managment/pages/admin/create_contract/models/financial_request.dart';

import '../../owners_tenants/models/users.dart';


abstract class IBondPreviewProvider {

  Future<ContractPaymentsBondModel> getPaymentContacts(int id);
  Future<ContractPaymentResponse?> creatPaymentContract(PaymentsRequest model);
  Future<ResponseBaseModel?> deletePaymentContract(int id);
  Future<ContractPaymentsBondModel?> updatePaymentContract(int id,ContractPayment model);
  Future<ConstantsLists> getConstantsLists();

  Future<ResponseBaseModel> deleteContract(int id);

  Future<ContractModel> getContractDetails(int id);
  Future<FinancialDataModel> getContractFinancialDetails(int id);

  Future<List<Users>> getUsers(String role);
  Future<List<RealStatesModel>> getRealStates();

  Future<ResponseBaseModel?>UpdateContractDetails(int id,ContractRequest model);
  Future<ResponseBaseModel?> UpdateContractFinancialDetails(int id,FinanicalRequest model);


  Future<ContractPaymentsBondModel?> getBondsDetails(int id,);

}

class BondPreviewProvider extends BaseAuthProvider implements IBondPreviewProvider {
  @override
  Future<ContractPaymentsBondModel> getPaymentContacts(int id) async{
    var response = await http.get(
        Uri.parse("${EndPoints.baseUrl}${EndPoints.contractPayments}${id}"),
        headers: EndPoints.requestHeader
    );
    return ContractPaymentsBondModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<ContractPaymentResponse?> creatPaymentContract(PaymentsRequest model) async{
    try{
      var response = await post(
        "${EndPoints.createPayment}${EndPoints.requestAuthorizationUrl}",
        model.toJson(),
        decoder: ContractPaymentResponse.fromJson,
      );
      return response.body;
    }catch(e){
      throw(e);
    }

  }

  @override
  Future<ResponseBaseModel?> deletePaymentContract(int id) async{
    var response = await http.delete(
        Uri.parse(
            "${EndPoints.baseUrl}${EndPoints.getContractPayment}/${id}"
        ),
        headers: EndPoints.requestHeader
    );
    return ResponseBaseModel.fromJson(json.decode(response.body));
  }

  @override
  Future<ContractPaymentsBondModel?> updatePaymentContract(int id, ContractPayment model) async{


    try{
      var response = await put(
        "${EndPoints.getContractPayment}/${id}",
        model.toJson(),
        decoder: ContractPaymentsBondModel.fromJson,
      );
      return response.body;
    }catch(e){
      throw(e);
    }


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

  @override
  Future<ContractModel> getContractDetails(int id) async{
    var response = await http.get(
        Uri.parse("${EndPoints.baseUrl}${EndPoints.getOneContract}${id}"),
        headers: EndPoints.requestHeader
    );
    return ContractModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<FinancialDataModel> getContractFinancialDetails(int id) async{
    var response = await http.get(
        Uri.parse("${EndPoints.baseUrl}${EndPoints.financial}/${id}"),
        headers: EndPoints.requestHeader
    );
    return FinancialDataModel.fromJson(jsonDecode(response.body));
  }
  @override
  Future<List<Users>> getUsers(String role) async {
    var response = await http.get(
        Uri.parse("${EndPoints.baseUrl}${EndPoints.getRealstateUsers}?role=${role}"),
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
  Future<ResponseBaseModel> deleteContract(int id)async {
    var response = await http.delete(
        Uri.parse(
            "${EndPoints.baseUrl}${EndPoints.getOneContract}${id}"
        ),
        headers: EndPoints.requestHeader
    );
    return ResponseBaseModel.fromJson(json.decode(response.body));
  }

  @override
  Future<ResponseBaseModel?> UpdateContractDetails(int id, ContractRequest model) async{
    try{
      var response = await put(
        "${EndPoints.getOneContract}${id}",
        model.toJson(),
        decoder: ResponseBaseModel.fromJson,
      );
      return response.body;
    }catch(e){
      throw(e);
    }
  }

  @override
  Future<ResponseBaseModel?> UpdateContractFinancialDetails(int id,FinanicalRequest model) async{
    try{
      var response = await put(
        "${EndPoints.financial}/${id}/update",
        model.toJson(),
        decoder: ResponseBaseModel.fromJson,
      );
      return response.body;
    }catch(e){
      throw(e);
    }
  }

  @override
  Future<ContractPaymentsBondModel?> getBondsDetails(int id) async{
    var response = await http.get(
        Uri.parse("${EndPoints.baseUrl}${EndPoints.contractPaymentsBonds}${id}"),
        headers: EndPoints.requestHeader
    );
    return ContractPaymentsBondModel.fromJson(jsonDecode(response.body));
  }


}
