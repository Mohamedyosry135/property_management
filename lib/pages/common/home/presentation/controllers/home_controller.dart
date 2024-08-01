import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/common/home/data/home_repository.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

class HomeController extends SuperController<dynamic> {
  HomeController({required this.homeRepository});

  final IHomeRepository homeRepository;
  var token;
  List<String> titles = [CommonLang.controlBoard.tr(), CommonLang.owners.tr(),CommonLang.representativeOwner.tr(), CommonLang.tenants.tr(),
    CommonLang.tenantRepresentative.tr(), CommonLang.realEstate.tr(), CommonLang.maintenanceRequests.tr(),CommonLang.personalPage.tr(), CommonLang.signOut.tr() ];

  List<String> iconPaths = [AppAssets.controllBoard(), AppAssets.owners(), AppAssets.actOnwer(), AppAssets.owners(), AppAssets.actOnwer(), AppAssets.building(), AppAssets.maintaince(), AppAssets.profileIcon(), AppAssets.exit(), ];

  RxBool showMenu = true.obs;

  changeIsShowMenu() => showMenu.toggle();

  List<String> titlesNotAdmin = [CommonLang.home.tr(), CommonLang.maintenanceRequests.tr(),CommonLang.personalPage.tr(),CommonLang.support.tr(), CommonLang.signOut.tr() ];

  List<String> iconPathsNotAdmin = [AppAssets.home(), AppAssets.maintaince(), AppAssets.profileIcon(), AppAssets.support(),AppAssets.exit(), ];

  RxInt   pageSelected = 0.obs;
  @override
  void onInit() async {
    if( AuthService.to.userInfo ==null){
       AuthService.to.logout().then((value){
        Get.rootDelegate.offNamed(Routes.LOGIN);
        Get.rootDelegate.backUntil(Routes.LOGIN);
      });

    }
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
