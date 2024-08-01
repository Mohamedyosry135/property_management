


import 'package:get/get.dart';
import 'package:property_managment/base/base_repositroy.dart';
import 'package:property_managment/consts/response_base_model.dart';
import 'package:property_managment/pages/admin/bond_preview/models/contract_payments_bond_model.dart';
import 'package:property_managment/pages/admin/bond_preview/models/financial_data_model.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:property_managment/pages/admin/create_contract/models/constants_lists.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_payment_request.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_payment_response.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_request.dart';
import 'package:property_managment/pages/admin/create_contract/models/financial_request.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';

import 'bond_preview_api_provider.dart';

abstract class IBondPreviewRepository {
  Future<ContractPaymentsBondModel> getPaymentContacts(int id);
  Future<ContractPaymentResponse?> creatPaymentContract(PaymentsRequest model);
  Future<ResponseBaseModel?> deletePaymentContract(int id);

  Future<ContractPaymentsBondModel?> updatePaymentContract(int id,ContractPayment model);
  Future<ConstantsLists> getConstantsLists();



  Future<ContractModel> getContractDetails(int id);
  Future<FinancialDataModel> getContractFinancialDetails(int id);

  Future<List<Users>> getUsers(String role);
  Future<List<RealStatesModel>> getRealStates();
  Future<ResponseBaseModel> deleteContract(int id);
  Future<ResponseBaseModel?>UpdateContractDetails(int id,ContractRequest model);
  Future<ResponseBaseModel?> UpdateContractFinancialDetails(int id,FinanicalRequest model);
  Future<ContractPaymentsBondModel> getBondsDetails(int id);



}

class BondPreviewRepository extends BaseRepository implements IBondPreviewRepository {
  BondPreviewRepository({required this.provider});
  final IBondPreviewProvider provider;

  @override
  Future<ContractPaymentsBondModel> getPaymentContacts(int id)async {
    final apiResponse = await provider.getPaymentContacts(id) ;
    printInfo(info: apiResponse.toString());
    if(apiResponse != null){
      return apiResponse;
    }else {
      throw(getErrorMessage("Error")) ;
    }
  }
  @override
  Future<ContractPaymentResponse?> creatPaymentContract(PaymentsRequest model) async{
    final apiResponse = await provider.creatPaymentContract(model);
    if(apiResponse != null ){
      return apiResponse;
    }else {
      throw(getErrorMessage("error")) ;
    }
  }

  @override
  Future<ResponseBaseModel?> deletePaymentContract(int id) async{
    final apiResponse = await provider.deletePaymentContract(id);
    if(apiResponse != null && (apiResponse.status?.contains("success") ?? false)){
      return apiResponse;
    }else {
      throw(getErrorMessage(apiResponse?.status  ?? "error")) ;
    }
  }

  @override
  Future<ContractPaymentsBondModel?> updatePaymentContract(int id, ContractPayment model) async{
    final apiResponse = await provider.updatePaymentContract(id,model);
    if(apiResponse != null ){
      return apiResponse;
    }else {
      throw(getErrorMessage("error")) ;
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



  @override
  Future<ContractModel> getContractDetails(int id) async{
    final apiResponse = await provider.getContractDetails(id) ;
    printInfo(info: apiResponse.toString());
    if(apiResponse != null){
      return apiResponse;
    }else {
      throw(getErrorMessage("Error")) ;
    }
  }

  @override
  Future<FinancialDataModel> getContractFinancialDetails(int id) async{
    final apiResponse = await provider.getContractFinancialDetails(id) ;
    printInfo(info: apiResponse.toString());
    if(apiResponse != null){
      return apiResponse;
    }else {
      throw(getErrorMessage("Error")) ;
    }
  }

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
  Future<ResponseBaseModel> deleteContract(int id)async {
    final apiResponse = await provider.deleteContract(id);
    if(apiResponse != null && (apiResponse.status?.contains("success") ?? false)){
      return apiResponse;
    }else {
      throw(getErrorMessage(apiResponse?.status  ?? "error")) ;
    }
  }

  @override
  Future<ResponseBaseModel?> UpdateContractDetails(int id, ContractRequest model)async {
    final apiResponse = await provider.UpdateContractDetails(id,model);
    if(apiResponse != null ){
      return apiResponse;
    }else {
      throw(getErrorMessage("error")) ;
    }
  }

  @override
  Future<ResponseBaseModel?> UpdateContractFinancialDetails(int id, FinanicalRequest model)async {
    final apiResponse = await provider.UpdateContractFinancialDetails(id,model);
    if(apiResponse != null ){
      return apiResponse;
    }else {
      throw(getErrorMessage("error")) ;
    }
  }

  @override
  Future<ContractPaymentsBondModel> getBondsDetails(int id) async{
    final apiResponse = await provider.getBondsDetails(id) ;
    printInfo(info: apiResponse.toString());
    if(apiResponse != null){
      return apiResponse;
    }else {
      throw(getErrorMessage("Error")) ;
    }
  }


}
