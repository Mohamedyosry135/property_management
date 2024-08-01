


import 'package:get/get.dart';
import 'package:property_managment/base/base_repositroy.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_payment_request.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_payment_response.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_request.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_response.dart';
import 'package:property_managment/pages/admin/create_contract/models/financial_request.dart';
import 'package:property_managment/pages/admin/create_contract/models/financial_response.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';

import '../models/constants_lists.dart';
import 'create_contract_api_provider.dart';

abstract class ICreateContractRepository {

  Future<FinanicalResponse?> createFinancial(FinanicalRequest model);
  Future<ContractResponse?> createContract(ContractRequest model);
  Future<ContractPaymentResponse?> creatPaymentContract(PaymentsRequest model);
  Future<List<Users>> getRealstateUsers(String role) ;
  Future<List<RealStatesModel>> getRealStates();
  Future<ConstantsLists> getConstantsLists();

}

class CreateContractRepository extends BaseRepository implements ICreateContractRepository {
  CreateContractRepository({required this.provider});
  final ICreateContractProvider provider;

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
  Future<ContractResponse?> createContract(ContractRequest model) async{
    final apiResponse = await provider.createContract(model);
    if(apiResponse != null ){
      return apiResponse;
    }else {
      throw(getErrorMessage("error")) ;
    }
  }

  @override
  Future<FinanicalResponse?> createFinancial(FinanicalRequest model) async{
    final apiResponse = await provider.createFinancial(model);
    if(apiResponse != null ){
      return apiResponse;
    }else {
      throw(getErrorMessage("error")) ;
    }
  }

  @override
  Future<List<Users>> getRealstateUsers(String role) async{
    final apiResponse = await provider.getRealstateUsers(role) ;
    if(apiResponse != null ){
      return apiResponse;
    }else {
      throw(getErrorMessage("error")) ;
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
