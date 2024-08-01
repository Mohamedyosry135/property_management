import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/buildings/data/buildings_repository.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/data/control_board_repository.dart';
import 'package:property_managment/pages/admin/owners_tenants/data/owners_tenants_repository.dart';
import 'package:property_managment/pages/common/home/data/home_repository.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

class BuildingsController extends SuperController<dynamic> {
  BuildingsController({required this.buildingsRepository});

  final IBuildingsRepository buildingsRepository;

  RxList<RealStatesModel> realStatesLit = <RealStatesModel>[].obs;
  List<RealStatesModel> realRealStatesLit = [];

  getRealStates() async{
    change(false, status: RxStatus.loading());
     await buildingsRepository.getRealStates().then((value){

       realStatesLit.value =value;
       realRealStatesLit = value;
      change(true, status: RxStatus.success());

    });
  }

  List<RealStatesModel>onSeachContract(String keySearch){
    return realRealStatesLit.where((item){
      return item.name!.toLowerCase().contains(keySearch.toLowerCase()) || item.identifier!.toLowerCase().contains(keySearch.toLowerCase() )  || item.city!.toLowerCase().contains(keySearch.toLowerCase())
          || item.neighborhood!.toLowerCase().contains(keySearch.toLowerCase())  || item.type!.toLowerCase().contains(keySearch.toLowerCase()) || item.usageType!.toLowerCase().contains(keySearch.toLowerCase());
    }).toList();

  }

  @override
  void onInit() async {
    if( AuthService.to.userInfo ==null){
       AuthService.to.logout().then((value){
        Get.rootDelegate.offNamed(Routes.LOGIN);
        Get.rootDelegate.backUntil(Routes.LOGIN);
      });

    }
    getRealStates();

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
