import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/control_board/presentation/controllers/control_board_controller.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/pages/admin/representative_owners_tenants/data/representative_owners_tenants_repository.dart';
import 'package:property_managment/pages/admin/control_board/data/control_board_repository.dart';
import 'package:property_managment/pages/admin/owners_tenants/data/owners_tenants_repository.dart';
import 'package:property_managment/pages/common/home/data/home_repository.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

class RepresentativeOwnersTenantsController extends SuperController<dynamic> {
  RepresentativeOwnersTenantsController({required this.representativeOwnersTenatsRepository});

  final IRepresentativeOwnersTenantsRepository representativeOwnersTenatsRepository;
  RxList<Users> users= <Users>[].obs;
  List<Users> realUsers= [];

   bool? isRepresentativeOwner;

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
    isRepresentativeOwner = args == null ?true:args[0]['isRepresentativeOwner'];
    getUsers(args[0]['isRepresentativeOwner']);

    super.onInit();


  }

  getUsers(bool isrepresentativeOwner ){
print("Hello");
    change(false, status: RxStatus.loading());
    representativeOwnersTenatsRepository.getUsers(isrepresentativeOwner ? "owner_representer":"renter_representer").then((value){
      users.value.addAll(value);
      realUsers.addAll(value);
      change(true, status: RxStatus.success());

    }).onError((error, stackTrace){
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
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

}
