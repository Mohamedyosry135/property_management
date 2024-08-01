import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/control_board/data/control_board_repository.dart';
import 'package:property_managment/pages/admin/control_board/presentation/controllers/control_board_controller.dart';
import 'package:property_managment/pages/admin/owners_tenants/data/owners_tenants_repository.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/pages/common/home/data/home_repository.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

class OwnersTenatsController extends SuperController<dynamic> {
  OwnersTenatsController({required this.ownersTenatsRepository});

  final IOwnersTenatsRepository ownersTenatsRepository;
  RxList<Users> users=<Users> [].obs;
  List<Users> realUsers= [];

  bool? isOwner;


  @override
  void onInit() async {
    change(false,status: RxStatus.loading());
    if( AuthService.to.userInfo ==null){
       AuthService.to.logout().then((value){
        Get.rootDelegate.offNamed(Routes.LOGIN);
        Get.rootDelegate.backUntil(Routes.LOGIN);
      });

    }
    var args = Get.rootDelegate.arguments();
    isOwner =args ==null ?true: args[0]['isOwner'] ?? true;
    super.onInit();
    getUsers( args  [0]['isOwner']);
    change(true,status: RxStatus.success());

  }
  getUsers(bool isowner){
    change(false, status: RxStatus.loading());
    ownersTenatsRepository.getUsers(isowner ?"owner" :"renter").then((value){
      users.value = value;
      realUsers =value;
      change(true, status: RxStatus.success());

    }).onError((error, stackTrace){
      print("flksdjfld ${error.toString()}");
      change(true, status: RxStatus.error());
      Get.snackbar("error", "error");
    });
  }

  List<Users>onSeachContract(String keySearch){
    return realUsers.where((item){
      return item.name!.toLowerCase().contains(keySearch.toLowerCase()) || item.verificationId!.toLowerCase().contains(keySearch.toLowerCase() )  || item.realstateNumber!.toLowerCase().contains(keySearch.toLowerCase()) ;
    }).toList();

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
