import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/add_building/data/add_building_repository.dart';
import 'package:property_managment/pages/admin/add_building/model/create_real_state_model.dart';
import 'package:property_managment/pages/admin/add_tenant_owner/data/add_tenant_owner_repository.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/presentation/controllers/control_board_controller.dart';
import 'package:property_managment/pages/admin/create_contract/models/constants_lists.dart';

import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

class AddBuildingController extends SuperController<dynamic> {
  AddBuildingController({required this.addBuildingRepository});

  final IAddBuildingRepository addBuildingRepository;
  RealStatesModel realStatesModel = RealStatesModel();
  CreateRealStateModel createRealStateModel = CreateRealStateModel();
  bool isEditing = false;
  TextEditingController realEstateNameController = TextEditingController();
  TextEditingController instrumentNumberController = TextEditingController();
  TextEditingController realEstateTypeController = TextEditingController();

  TextEditingController realEstateUsageController = TextEditingController();

  TextEditingController cityNameController = TextEditingController();
  TextEditingController districtNameController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  ConstantsLists constantsLists = ConstantsLists();

  List<String>cities = [];
  List<String>neighborhoods = [];
  List<String>propertyTypes = [];
  List<String>propertyUsage= [];

  RxString selectedCity = "".obs;
  RxString selectedNeighborhoods = "".obs;
  RxString selectedPropertyTypes = "".obs;
  RxString selectePropertyUsage = "".obs;

  final formKey = GlobalKey<FormState>();
  List<Users> ownersList = [];
  Rx<Users> selectedOwner = Users().obs;

  setEditData(){
    realEstateNameController.text = realStatesModel.name ?? "";
    realEstateTypeController.text = realStatesModel.type ?? "";
    instrumentNumberController.text = realStatesModel.identifier ?? "";
    cityNameController.text = realStatesModel.city ??"";
    selectedCity.value =realStatesModel.city ??"";

    selectedPropertyTypes.value = realStatesModel.type ?? "";
    selectePropertyUsage.value = realStatesModel.usageType ??"";
    selectedNeighborhoods.value = realStatesModel.neighborhood ??"";
    districtNameController.text = realStatesModel.neighborhood ??"";
    areaController.text = realStatesModel.area.toString() ??"";
  }

  getConstantsList()async{
    change(false, status: RxStatus.loading());
    await addBuildingRepository.getConstantsLists().then((value) {
      constantsLists = value;
      cities.addAll(constantsLists.data?.cities ??[]);
      neighborhoods.addAll(constantsLists.data?.neighborhoods ??[]);
      propertyTypes.addAll(constantsLists.data?.propertyTypes ??[]);
      propertyUsage.addAll(constantsLists.data?.propertyUsages ??[]);

      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.success());
      print("eror ${error.toString()}");
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
      Get.snackbar("خطأ", "حدث خطأ ما");
    });
  }

  setRequestModel() async{
    createRealStateModel = CreateRealStateModel(
      name: realEstateNameController.text.toString(),
      type: selectedPropertyTypes.value,
      area: double.tryParse(areaController.text.toString()),
      city: cityNameController.text.toString(),
      identifier: instrumentNumberController.text.toString(),
      neighborhood:  districtNameController.text.toString(),
      ownerId: selectedOwner.value.id,
      usageType: selectePropertyUsage.value
    );
    addRealState(createRealStateModel);
  }
  addRealState(CreateRealStateModel model){
    change(false, status: RxStatus.loading());
    var apiResp = addBuildingRepository.addRealState(model).then((value) {
      print("addBuildingRepository");
      change(true, status: RxStatus.success());
      Get.snackbar("", CommonLang.addedSuccessfully.tr());

      Get.rootDelegate.offNamed(
        Routes.REALESTATES,
      );

    }, onError: (err) {
      Get.snackbar(CommonLang.error.tr(), err.toString());
      change(true, status: RxStatus.success());
    });
  }
  editRealState(CreateRealStateModel model ){
    model =
        CreateRealStateModel(
            name: realEstateNameController.text.toString(),
            type: realEstateTypeController.text.toString(),
            area: 100,
            city: "New York",
            identifier: instrumentNumberController.text.toString(),
            neighborhood: "Upper East Side",
            ownerId: selectedOwner.value.id,
            usageType: "residential"
        );
    change(false, status: RxStatus.loading());
    var apiResp = addBuildingRepository.editRealState(model,realStatesModel.id.toString()).then((value) {
      change(true, status: RxStatus.success());
      Get.snackbar("", CommonLang.editedSuccesssfully.tr());

      Get.rootDelegate.offNamed(
        Routes.REALESTATES,
      );

    }, onError: (err) {
      Get.snackbar("", err.toString());
      change(true, status: RxStatus.success());
    });
  }
  deleteRealState(){
    change(false, status: RxStatus.loading());
    var apiResp = addBuildingRepository.deleteRealState(realStatesModel.id.toString()).then((value) {
      change(true, status: RxStatus.success());
      Get.snackbar("", CommonLang.deletedSuccessfully.tr());

      Get.rootDelegate.offNamed(
          Routes.REALESTATES,
          );
    }, onError: (err) {
    Get.snackbar("", err.toString());
    change(true, status: RxStatus.success());
    });
  }

  @override
  void onInit() async {

    change(false, status: RxStatus.loading());
    if( AuthService.to.userInfo ==null){
       AuthService.to.logout().then((value){
        Get.rootDelegate.offNamed(Routes.LOGIN);
        Get.rootDelegate.backUntil(Routes.LOGIN);
      });

    }
    if(Get.rootDelegate.arguments() != null){
      realStatesModel = Get.rootDelegate.arguments()['realStatesModel'];
      isEditing = true;
      setEditData();

    }
    getConstantsList();
    getUsers();

    super.onInit();
  }
  getUsers() async{
    change(false, status: RxStatus.loading());
    ownersList = await addBuildingRepository.getUsers();
    print(ownersList.length);
    if(Get.rootDelegate.arguments() != null) {
      selectedOwner.value = ownersList.firstWhereOrNull((element) => element.id == realStatesModel.ownerId) ?? Users();

    }

    change(true, status: RxStatus.success());
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
