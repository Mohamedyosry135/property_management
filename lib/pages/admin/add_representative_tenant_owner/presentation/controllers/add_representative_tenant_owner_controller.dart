import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/add_representative_tenant_owner/data/add_representative_tenant_owner_repository.dart';
import 'package:property_managment/pages/admin/add_tenant_owner/data/add_tenant_owner_repository.dart';
import 'package:property_managment/pages/admin/add_tenant_owner/models/create_user_request.dart';
import 'package:property_managment/pages/admin/control_board/presentation/controllers/control_board_controller.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

class AddRepresentativeTenantOwnerController extends SuperController<dynamic> {
  AddRepresentativeTenantOwnerController({required this.addRepresentativeTenantOwnerRepository});

  final IAddRepresentativeTenantOwnerRepository addRepresentativeTenantOwnerRepository;

  bool isRepresentativeOwner = false;
  CreateUserRequest createUserRequest = CreateUserRequest();
  List<String> userRoles = [];
  RxString selectedRole = "".obs;
  Map<String ,String> translateMap =
  {"owner_representer":CommonLang.representativeOwner.tr(), "renter_representer":CommonLang.tenantRepresentative.tr()};
  @override
  void onInit() async {
    change(false, status: RxStatus.loading());
    if( AuthService.to.userInfo ==null){
       AuthService.to.logout().then((value){
        Get.rootDelegate.offNamed(Routes.LOGIN);
        Get.rootDelegate.backUntil(Routes.LOGIN);
      });

    }
    var args = Get.rootDelegate.arguments();
    isRepresentativeOwner = args==null ? true : args[0]['isRepresentativeOwner'] ??true;
    print("isRepresentativeOwner $isRepresentativeOwner}");

    createUserRequest.role= isRepresentativeOwner?"owner_representer" : "renter_representer";
    selectedRole.value =isRepresentativeOwner?"owner_representer" : "renter_representer";




    userRoles.add( translateMap[selectedRole.value] ??"");
    change(true, status: RxStatus.success());
    super.onInit();
  }
  onCreateUser(){
    change(false, status: RxStatus.loading());
    // createUserRequest.role= "admin";
    createUserRequest.password= "admin";
    createUserRequest.realstateEndsDate= "2016-05-05";
    createUserRequest.realstateNumber= "admin";

    addRepresentativeTenantOwnerRepository.addUser(createUserRequest).then((value){
      Get.snackbar("", CommonLang.addedSuccessfully.tr());

      isRepresentativeOwner? Get.rootDelegate.offNamed(
          Routes.OWNER_REPRESENTATIVE,
          arguments: [
            {"isRepresentativeOwner": true}
          ]): Get.rootDelegate.offNamed(
          Routes.TENANT_REPRESENTATIVE,
          arguments: [
            {"isRepresentativeOwner": false}
          ]);
      change(true, status: RxStatus.success());

    }).onError((error, stackTrace){
      change(true, status: RxStatus.success());
      Get.snackbar("خطأ", "حصل خطأ ما");
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
  TextEditingController birthDate = TextEditingController();
  pickDate(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(ColorCode.blue), // Set the primary color to blue
            colorScheme: ColorScheme.light(primary: Color(ColorCode.blue)), // Set the color scheme to use blue
          ),
          child: child!,
        );
      },
    );
    return pickedDate;
  }
}
