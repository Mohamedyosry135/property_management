import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/buildings/data/buildings_repository.dart';
import 'package:property_managment/pages/admin/control_board/data/control_board_repository.dart';
import 'package:property_managment/pages/admin/owners_tenants/data/owners_tenants_repository.dart';
import 'package:property_managment/pages/common/home/data/home_repository.dart';
import 'package:property_managment/pages/common/maintenance_requests/data/maintenance_requests_repository.dart';
import 'package:property_managment/pages/common/maintenance_requests/model/maintaenance_requests_model.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

class MaintenanceRequestsController extends SuperController<dynamic> {
  MaintenanceRequestsController({required this.maintenanceRequestsRepository});

  final IMaintenanceRequestsRepository maintenanceRequestsRepository;


  MaintenanceRequestsModel? maintenanceRequestsModel;
  getMaintenanceRequests() async{
    change(false, status: RxStatus.loading());
    await maintenanceRequestsRepository.getMaintenanceRequests().onError((error, stackTrace) {
      print("error ${error.toString()}");

      change(true, status: RxStatus.success());
      maintenanceRequestsModel = MaintenanceRequestsModel();
      return MaintenanceRequestsModel();
    }).then((value) {
      maintenanceRequestsModel = value;
      change(true, status: RxStatus.success());

    });
  }

  @override
  void onInit() async {
    if( AuthService.to.userInfo ==null){
      await AuthService.to.logout().then((value){
        Get.rootDelegate.offNamed(Routes.LOGIN);
        Get.rootDelegate.backUntil(Routes.LOGIN);
      });

    }
    getMaintenanceRequests();

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
