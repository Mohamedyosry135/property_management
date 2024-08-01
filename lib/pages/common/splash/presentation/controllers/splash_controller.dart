
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_permissions/notification_permissions.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_managment/pages/common/splash/data/splash_repository.dart';
import 'package:property_managment/pages/common/support/data/support_repository.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

class SplashController extends SuperController<bool> {
  SplashController({required this.splashRepository});

  final ISplashRepository splashRepository;
  @override
  void onInit() async {
    change(null,status: RxStatus.success());
    Future.delayed(const Duration(seconds: 2)).then((value) {
      final isLoggedIn = AuthService.to.isLoggedIn.value;
      final isSelectedLanguage = AuthService.to.isSelectedLanguage.value;
      if(true){

        Get.rootDelegate.offNamed(Routes.LOGIN) ;

      }else{
        Get.rootDelegate.offNamed(Routes.LOGIN);
      }


    });
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
  }
}
