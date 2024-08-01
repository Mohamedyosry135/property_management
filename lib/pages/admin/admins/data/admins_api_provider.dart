// ignore: one_member_abstracts

import 'dart:convert';

import 'package:property_managment/base/api_end_points.dart';
import 'package:property_managment/base/base_auth_provider.dart';
import 'package:get/get.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';

import 'package:http/http.dart' as http;

abstract class IAdminsProvider {

  Future<List<Users>> getUsers(String role);

}

class AdminsProvider extends BaseAuthProvider implements IAdminsProvider {


  @override
  Future<List<Users>> getUsers(String role) async {
    var response = await http.get(
        Uri.parse("${EndPoints.baseUrl}${EndPoints.getRealstateUsers}?role=${role}"),
        headers: EndPoints.requestHeader
    );
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((item) => Users.fromJson(item)).toList();
  }
}
