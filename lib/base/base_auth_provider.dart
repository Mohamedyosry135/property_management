import 'package:property_managment/base/api_end_points.dart';
import 'package:property_managment/base/base_provider.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:property_managment/services/auth_service.dart';



class BaseAuthProvider extends  BaseProvider {
  @override
  void onInit() {
    super.onInit() ;
    httpClient.baseUrl =EndPoints.baseUrl;
  }
}
