// ignore: one_member_abstracts

import 'dart:convert';

import 'package:property_managment/base/api_end_points.dart';
import 'package:property_managment/base/base_auth_provider.dart';
import 'package:get/get.dart';
import 'package:property_managment/pages/admin/bond_preview/models/contract_payments_bond_model.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:http/http.dart' as http;
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';


abstract class IBondsForUserProvider {
  Future<ContractPaymentsBondModel> getPaymentContacts(int id);
  Future<ContractPaymentsBondModel?> getBondsDetails(int id,);



}

class BondsForUserProvider extends BaseAuthProvider implements IBondsForUserProvider {

  @override
  Future<ContractPaymentsBondModel> getPaymentContacts(int id) async{
    var response = await http.get(
        Uri.parse("${EndPoints.baseUrl}${EndPoints.contractPayments}${id}"),
        headers: EndPoints.requestHeader
    );
    return ContractPaymentsBondModel.fromJson(jsonDecode(response.body));
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
