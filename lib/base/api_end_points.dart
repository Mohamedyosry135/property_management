import 'package:flutter/foundation.dart';
import 'package:property_managment/services/auth_service.dart';

class EndPoints {
  static  String baseUrl =  kIsWeb ?  AuthService.to.webBrowserInfo!.language == "ar" ?  "https://dashboard.tammem.com.sa/ar_AA/api/v1/" :"https://dashboard.tammem.com.sa/api/v1/" : "https://dashboard.tammem.com.sa/api/v1/";
  static const String loginEndPoint = "realstate_users/login";
  static const String sendMessageSupport = "realstate_users/emails";

  static const String getRealstateUsers = "real_estate_user/user";
  static const String deleteRealEstateUser = "realestate_user/";
  static const String updateRealEstateUser = "realstate_users/update/";
  static const String getAllContracts = "contract";
  static const String getOneContract = "contracts/";

  static const String getContractPayment = "contract_payments";
  static const String getRealStates = "realstate";
  static const String getConstantsList = "realstate/constants";

  static const String contractPayments = "contract_payments_filter?contract_id=";
  static const String contractPaymentsBonds = "contract_payments_with_flag?contract_id=";

  static const String addRealState = "realstate/create";
  static const String maintenanceRequests = "maintenance";
  static const String userCreate = "realstate_users/create";
  static const String profileData = "realstate_users/user";
  static const String financial = "financial";
  static const String createPayment = "contract_payments/create";
  static const String createContract = "contracts/create";



  static Map<String,String> requestHeader = {
    "Authorization" : '${AuthService.to.userInfo?.result?.data?.id.toString() ?? ""} ${AuthService.to.userInfo?.result?.data?.token ?? ""}'
    ""
  };
  static  String requestAuthorizationUrl = "?id=${AuthService.to.userInfo?.result?.data?.id ?? ""} &token=${AuthService.to.userInfo?.result?.data?.token ?? ""}";




}
