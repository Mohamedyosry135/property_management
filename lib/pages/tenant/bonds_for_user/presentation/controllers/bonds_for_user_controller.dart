import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_managment/pages/admin/bond_preview/models/contract_payments_bond_model.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/pages/common/home/data/home_repository.dart';
import 'package:property_managment/pages/tenant/bonds_for_user/data/bonds_for_user_repository.dart';
import 'package:property_managment/pages/tenant/home_tenant_owner/data/home_tenant_owner_repository.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

class BondsForUserController extends SuperController<dynamic> {
  BondsForUserController({required this.bondsForUserRepository});

  final IBondsForUserRepository bondsForUserRepository;
  ContractPaymentsBondModel? contractPaymentsBondModel;
  ContractPaymentsBondModel? contractPaymentsBonds;


  @override
  void onInit() async {
    change(false, status: RxStatus.loading());

    var args = Get.rootDelegate.parameters;
    if( AuthService.to.userInfo?.result?.data?.role == "owner"){
      print("HELLO IT IS OWNER");
      getPaymentContacts(int.tryParse(args['id']!)!);

    }

    getPaymentBonds(int.tryParse(args['id']!)!);
    super.onInit();



  }

  getPaymentContacts(int id){
    change(false, status: RxStatus.loading());
    bondsForUserRepository.getPaymentContacts(id).then((value){
      contractPaymentsBondModel = value;
      change(true, status: RxStatus.success());

    }).onError((error, stackTrace){
      print("error ${error.toString()}");
      Get.snackbar("خطأ", "حصل خطأ ما");
      change(true, status: RxStatus.success());
      Get.rootDelegate. offNamed(Routes.HOME_TENANT_OWNER_VIEW);
    });
  }


  getPaymentBonds(int id) {
    change(false, status: RxStatus.loading());
    bondsForUserRepository.getBondsDetails(id).then((value) {
      contractPaymentsBonds = ContractPaymentsBondModel(status: value.status,message: value.message, statusCode: value.statusCode,data: []);
      if(value.data!.isNotEmpty ){
        for(int i=0; i<value.data!.length; i++) {
          if(value.data![i].price >0 || value.data![i].totalPrice >0 || value.data![i].taxAmount >0 ) {
            contractPaymentsBonds!.data!.add(value.data![i]) ;
          }
        }
      }

      change(true, status: RxStatus.success());

    }).onError((error, stackTrace) {
      print("error ${error.toString()}");
      Get.snackbar("خطأ", "حصل خطأ ما");
      change(true, status: RxStatus.success());
      Get.rootDelegate.offNamed(Routes.HOME_TENANT_OWNER_VIEW);
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
