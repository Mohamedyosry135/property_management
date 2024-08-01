
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_permissions/notification_permissions.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/common/support/data/support_repository.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

class SupportController extends SuperController<dynamic> {
  SupportController({required this.supportRepository});

  final ISupportRepository supportRepository;
  String message = "";
  TextEditingController messageController = TextEditingController();
  @override
  void onInit() async {
    change(false, status: RxStatus.loading());

    if( AuthService.to.userInfo ==null){
      await AuthService.to.logout().then((value){
        Get.rootDelegate.offNamed(Routes.LOGIN);
        Get.rootDelegate.backUntil(Routes.LOGIN);
      });

  }
  change(true, status: RxStatus.success());

  super.onInit();


  }

  sendRequest(){
    change(false, status: RxStatus.loading());
    supportRepository.addMessageSupport(message).then((value){
      message = "";
      messageController.text = "";
      Get.snackbar("", value.result?.status ??"");
      change(true, status: RxStatus.success());

    }).onError((error, stackTrace){
      Get.snackbar("", CommonLang.error.tr());
      change(true, status: RxStatus.success());
    });
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
