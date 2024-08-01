import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/pages/common/maintenance_requests/data/maintenance_requests_repository.dart';
import 'package:property_managment/pages/common/maintenance_requests/model/add_maintenance_request.dart';
import 'package:property_managment/pages/common/maintenance_requests/model/maintaenance_requests_model.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';
import 'package:intl/intl.dart';


class AddMaintenanceRequestController extends SuperController<dynamic> {
  AddMaintenanceRequestController({required this.maintenanceRequestsRepository});

  final IMaintenanceRequestsRepository maintenanceRequestsRepository;
  List<RealStatesModel> realStatesLit = [];
  Rx<RealStatesModel> selectedRealState = RealStatesModel().obs;
  AddMaintenanceRequest addMaintenanceRequest = AddMaintenanceRequest();
  RequestData requestData = RequestData();
  TextEditingController detailsController = TextEditingController();
  Rx<bool> realStatesLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  bool isEditing = false;
  List<ContractModel> contractModel = [];
  List<Users> users= [];

  Rx<ContractModel> selectedContractModel = ContractModel().obs;

  editMaintenanceRequest(AddMaintenanceRequest model){
    change(false, status: RxStatus.loading());
    var apiResp = maintenanceRequestsRepository.editMaintenanceRequest(model,requestData.id.toString()).then((value) {
      change(true, status: RxStatus.success());
      Get.snackbar("", CommonLang.editedSuccesssfully.tr());

      Get.rootDelegate
          . offNamed(Routes.MAINTAINCE_REQUESTS_VIEW,);
    }, onError: (err) {
      Get.snackbar("", err.toString());
      change(true, status: RxStatus.success());
    });
  }

  getRealStates() async{
    realStatesLoading.value = true;
     await maintenanceRequestsRepository.getRealStates().then((estats)async{
       realStatesLit =estats;
       getUsers(estats);
    });
    if(isEditing){
      selectedRealState.value = realStatesLit.firstWhere((element) => element.id == requestData.realStateId);
    }
    realStatesLoading.value = false;
    update();
  }

  setRequestModel() async{
    addMaintenanceRequest = AddMaintenanceRequest(
      realStateId: selectedContractModel.value.realStateId!,
      status: "in_progress",
      details: orderDetailsController.text,
      userId: AuthService.to.userInfo?.result?.data?.id,
      name: AuthService.to.userInfo?.result?.data?.name,
      phone:AuthService.to.userInfo?.result?.data?.phone,
 realstateArea: int.tryParse(unitAreaController.text),
 // realstateCity: ,
 // realstateDistrict: ,
 realstateName: buildingController.text,
 realstateType: realEstateTypeController.text,
 realstateUsageType: unitTypeController.text,
 // renterEmail: ,
 // renterName: ,
 // renterPhone: ,
 // renterRepresenterEmail: ,
 // renterRepresenterName: ,
 // renterRepresenterPhone:,

 //  TextEditingController realEstateTypeController =TextEditingController();
      //   TextEditingController unitTypeController =TextEditingController();
      //   TextEditingController unitAreaController =TextEditingController();
      //   TextEditingController ownerController =TextEditingController();
      //   TextEditingController representativeOwnerController =TextEditingController();
      //   TextEditingController mobileNumberController =TextEditingController();
      //   TextEditingController emailController =TextEditingController();
      //   TextEditingController orderDetailsController =TextEditingController();
      //   TextEditingController buildingController =TextEditingController();
    );
    addMaintenance(addMaintenanceRequest);
  }

  addMaintenance(AddMaintenanceRequest model){
    change(false, status: RxStatus.loading());
    var apiResp = maintenanceRequestsRepository.addMaintenanceRequest(model).then((value) {
      change(true, status: RxStatus.success());
      Get.snackbar("", CommonLang.addedSuccessfully.tr());
      Get.rootDelegate
          . offNamed(Routes.MAINTAINCE_REQUESTS_VIEW,);
    }, onError: (err) {
      Get.snackbar("", err.toString());
      change(true, status: RxStatus.success());
    });
  }

  deleteMaintenanceRequest(){
    change(false, status: RxStatus.loading());
    var apiResp = maintenanceRequestsRepository.deleteMaintenanceRequest(requestData.id.toString()).then((value) {
      change(true, status: RxStatus.success());
      Get.snackbar("", CommonLang.deletedSuccessfully.tr());
      Get.rootDelegate
          . offNamed(Routes.MAINTAINCE_REQUESTS_VIEW,);
    }, onError: (err) {
      Get.snackbar("", err.toString());
      change(true, status: RxStatus.success());
    });
  }


  setEditData(){
    detailsController.text = requestData.details ?? "";
  }
  getContracts() async{
    change(false, status: RxStatus.loading());
    await maintenanceRequestsRepository.getContracts().then((value){
      contractModel = value;
          getRealStates();
    });
  }
  TextEditingController realEstateTypeController =TextEditingController();
  TextEditingController unitTypeController =TextEditingController();
  TextEditingController unitAreaController =TextEditingController();
  TextEditingController ownerController =TextEditingController();
  TextEditingController representativeOwnerController =TextEditingController();
  TextEditingController mobileNumberController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController orderDetailsController =TextEditingController();
  TextEditingController buildingController =TextEditingController();

  @override
  void onInit() async {
    change(false, status: RxStatus.loading());
    if( AuthService.to.userInfo ==null){
      await AuthService.to.logout().then((value){
        Get.rootDelegate.offNamed(Routes.LOGIN);
        Get.rootDelegate.backUntil(Routes.LOGIN);
      });

    }
    getContracts();
    if(Get.rootDelegate.arguments() != null){
      requestData = Get.rootDelegate.arguments()['requestData'];
      isEditing = true;

      setEditData();
    }else{
    }

    super.onInit();


  }
  getUsers(List<RealStatesModel> estates)async{
    change(false, status: RxStatus.loading());
    maintenanceRequestsRepository.getUsers().then((value){
      users = value;
      change(true, status: RxStatus.success());

    }).onError((error, stackTrace){
      change(true, status: RxStatus.error());
      Get.snackbar("error", "error");
    });
  }
  changedSelectedContractID(ContractModel contractModel){
    int realEstateId = contractModel.realStateId! ;
    realEstateTypeController.text = "";
    unitTypeController.text = "";
    unitAreaController.text = "";
    buildingController.text = "";
    ownerController.text = "";
    emailController.text = "";
    mobileNumberController.text = "";
    // representativeOwnerController.text = "";

    RealStatesModel? selectedRealStates = realStatesLit.firstWhereOrNull((element) => element.id == realEstateId);
    if(selectedRealStates !=null){
      realEstateTypeController.text = selectedRealStates.usageType;
      unitTypeController.text = selectedRealStates.type;
      unitAreaController.text = selectedRealStates.area.toString();
      buildingController.text = selectedRealStates.name.toString();
    }

    int? ownerId = contractModel.ownerId ;
    int? ownerRepresenterId = contractModel.ownerRepresenterId ;

    Users? ownerUser = users.firstWhereOrNull((element) => element.id == ownerId);
    Users? representativeOwnerUser = users.firstWhereOrNull((element) =>  element.id==ownerRepresenterId);
    if(ownerUser !=null){
      ownerController.text = ownerUser.name ??"";
      emailController.text = ownerUser.email ??"";
      mobileNumberController.text = ownerUser.phone ??"";

    }
    if(representativeOwnerUser !=null){
      representativeOwnerController.text = representativeOwnerUser.name ??"";
    }

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
