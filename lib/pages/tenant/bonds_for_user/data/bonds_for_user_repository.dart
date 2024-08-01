


import 'package:get/get.dart';
import 'package:property_managment/base/base_repositroy.dart';
import 'package:property_managment/pages/admin/bond_preview/models/contract_payments_bond_model.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';

import 'bonds_for_user_api_provider.dart';

abstract class IBondsForUserRepository {
  Future<ContractPaymentsBondModel> getPaymentContacts(int id);

  Future<ContractPaymentsBondModel> getBondsDetails(int id);


}

class BondsForUserRepository extends BaseRepository implements IBondsForUserRepository {
  BondsForUserRepository({required this.provider});
  final IBondsForUserProvider provider;

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
