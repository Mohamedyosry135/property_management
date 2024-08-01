// ignore: one_member_abstracts

import 'dart:convert';

import 'package:property_managment/base/api_end_points.dart';
import 'package:property_managment/base/base_auth_provider.dart';
import 'package:get/get.dart';

import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:http/http.dart' as http;

abstract class IBuildingsProvider {

  Future<List<RealStatesModel>> getRealStates();

}

class BuildingsProvider extends BaseAuthProvider implements IBuildingsProvider {
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
