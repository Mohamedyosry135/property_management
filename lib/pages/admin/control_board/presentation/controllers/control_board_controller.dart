import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/data/control_board_repository.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:property_managment/pages/admin/create_contract/models/constants_lists.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/pages/common/home/data/home_repository.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

class ControlBoardController extends SuperController<dynamic> {
  ControlBoardController({required this.controlBoardRepository});

  final IControlBoardRepository controlBoardRepository;

  RxList<ContractModel> contractModel = <ContractModel>[].obs;
  List<ContractModel> realContractModel = [];

  List<Users> users= [];
  List<RealStatesModel> realStatesLit = [];
  ConstantsLists constantsLists = ConstantsLists();

  @override
  void onInit() async {
    // if( AuthService.to.userInfo ==null){
    //   Get.rootDelegate.offNamed(Routes.LOGIN);
    //   Get.rootDelegate.backUntil(Routes.LOGIN);
    //
    // }
    getContracts();
    getUsers();
    getRealStates();
    getConstantsList();
    super.onInit();


  }
  int realstateCount = 0;
  int contractCount  = 0;
  int ownerCount = 0;
  int renterCount = 0;
  getConstantsList()async{
    change(false, status: RxStatus.loading());
    await controlBoardRepository.getConstantsLists().then((value) {
      constantsLists = value;
      realstateCount = value.data?.realstateCount ?? 0;
      contractCount = value.data?.contractCount ?? 0;
      ownerCount = value.data?.ownerCount ?? 0;
      renterCount = value.data?.renterCount ?? 0;

      print("constantsLists.data?.cities?.length ${constantsLists.data?.cities?.length}");
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.success());
      print("eror ${error.toString()}");
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
      Get.snackbar("خطأ", "حدث خطأ ما");
    });
  }

  getRealStates() async{
    change(false, status: RxStatus.loading());
    realStatesLit = await controlBoardRepository.getRealStates();
    change(true, status: RxStatus.success());
  }
  getUsers(){
    change(false, status: RxStatus.loading());
    controlBoardRepository.getUsers().then((value){
      users = value;
      change(true, status: RxStatus.success());

    }).onError((error, stackTrace){
      change(true, status: RxStatus.error());
      Get.snackbar("error", "error");
    });
  }
  getContracts() async{
    change(false, status: RxStatus.loading());
     await controlBoardRepository.getContracts().then((value){
       contractModel.value =value;
      realContractModel = value;
       change(true, status: RxStatus.success());

     });

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
