
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_permissions/notification_permissions.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/common/login/data/login_repository.dart';
import 'package:property_managment/pages/common/splash/data/splash_repository.dart';
import 'package:property_managment/pages/common/support/data/support_repository.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

import 'package:universal_html/html.dart' as html;

class LoginController extends SuperController<bool> {
  LoginController({required this.loginRepository});

  final ILoginRepository loginRepository;
  RxBool isHiddenPassword = true.obs;
  String email = "", password = "";
  changeIsHiddenPassword() => isHiddenPassword.toggle();


  onLoginClicked() {
    change(false, status: RxStatus.loading());
    var apiResp = loginRepository.login(email, password).then((value) async{

      if(value.result != null){
        final thenTo = Get
            .rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
        value.result?.data?.role == "admin"?
        Get.rootDelegate. offNamed(thenTo ?? Routes.CONTROLL_bOARD_VIEW) :  Get.rootDelegate. offNamed(thenTo ?? Routes.HOME_TENANT_OWNER_VIEW);
        // Get.rootDelegate. offNamed(Routes.nextsignupView);
        change(true, status: RxStatus.success());
      }else{
        Get.snackbar("", CommonLang.invalidMailPassword.tr());
        change(true, status: RxStatus.success());

      }

    }, onError: (err) {
      print( "error ${err}");
      Get.snackbar("", CommonLang.invalidMailPassword.tr());
      change(true, status: RxStatus.success());
    });
  }
  @override
  void onInit() async {
    change(null,status: RxStatus.success());
    super.onInit();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }


  @override
  void onResumed() {
    // TODO: implement onResumed
    print("kldjsfkldjsf");
  }
  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }

  bool isValidEmail(String email) {
    // Define a regex pattern to match a valid email address
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return emailRegex.hasMatch(email);
  }


  bool isValidPassword(String password) {
    // Define a regex pattern to match a valid password
    // final RegExp passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

    return password.length > 6;
  }
}
