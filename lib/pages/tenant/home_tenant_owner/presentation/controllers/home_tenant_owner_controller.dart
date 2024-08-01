import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/pages/common/home/data/home_repository.dart';
import 'package:property_managment/pages/tenant/home_tenant_owner/data/home_tenant_owner_repository.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

class HomeTenantOwnerController extends SuperController<dynamic> {
  HomeTenantOwnerController({required this.homeTenantOwnerRepository});

  final IHomeTenantOwnerRepository homeTenantOwnerRepository;
  RxList<ContractModel> contractModel = <ContractModel>[].obs;
  List<ContractModel> realContractModel = [];

  List<Users> users= [];
  List<RealStatesModel> realStatesLit = [];

  @override
  void onInit() async {
    if( AuthService.to.userInfo ==null){
      await AuthService.to.logout().then((value){
        Get.rootDelegate.offNamed(Routes.LOGIN);
        Get.rootDelegate.backUntil(Routes.LOGIN);
      });

    }
    getContracts();
    getUsers();
    getRealStates();
    super.onInit();


  }

  getRealStates() async{
    change(false, status: RxStatus.loading());
    realStatesLit = await homeTenantOwnerRepository.getRealStates();
    change(true, status: RxStatus.success());
  }
  getUsers(){
    change(false, status: RxStatus.loading());
    homeTenantOwnerRepository.getUsers().then((value){
      users = value;
      change(true, status: RxStatus.success());

    }).onError((error, stackTrace){
      change(true, status: RxStatus.error());
      Get.snackbar("error", "error");
    });
  }
  getContracts() async{
    change(false, status: RxStatus.loading());
    await homeTenantOwnerRepository.getContracts().then((value){
      contractModel.value = value;
      realContractModel = value;
    });
    change(true, status: RxStatus.success());
  }

  List<ContractModel>onSeachContract(String keySearch){
    return realContractModel.where((item){
      return item.contractNumber!.contains(keySearch) || item.ownerName!.toLowerCase().contains(keySearch.toLowerCase()) || item.renterName!.toLowerCase().contains(keySearch.toLowerCase())  ;
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
