import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/add_tenant_owner/data/add_tenant_owner_repository.dart';
import 'package:property_managment/pages/admin/add_tenant_owner/models/create_user_request.dart';
import 'package:property_managment/pages/admin/control_board/presentation/controllers/control_board_controller.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

class AddTenantOwnerController extends SuperController<dynamic> {
  AddTenantOwnerController({required this.addTenantOwnerRepository});

  final IAddTenantOwnerRepository addTenantOwnerRepository;

  String isOwner = "";
  CreateUserRequest createUserRequest = CreateUserRequest();
  List<String> userRoles = [];
  RxString selectedRole = "".obs;
  Map<String ,String> translateMap =
  {"admin":CommonLang.admin.tr(), "owner":CommonLang.owner.tr(), "renter":CommonLang.tenant.tr()};
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
    selectedRole.value = args[0]['isOwner'];
    isOwner = args[0]['isOwner'];
    createUserRequest.role =args[0]['isOwner'];
    userRoles.add(translateMap[args[0]['isOwner'] ] ??"");
    // createUserRequest.role= isOwner?"owner" : "renter";

    print("isOwner $isOwner}");
    change(true, status: RxStatus.success());

    super.onInit();
  }


  onCreateUser(){
    change(false, status: RxStatus.loading());
    // createUserRequest.role= "admin";
    addTenantOwnerRepository.addUser(createUserRequest).then((value){
      print(value?.toJson());
      // controlBoardController.getUsers();
      if(value?.result?.statusCode == 422){
        Get.snackbar("", value?.result?.error ??"");

      }else{
        Get.snackbar("", CommonLang.addedSuccessfully.tr());

        if(isOwner == "owner"){
          Get.rootDelegate
              . offNamed(Routes.OWNER, arguments: [
            {"isOwner": true}
          ]);
        }else if(isOwner == "renter"){
          Get.rootDelegate
              .offNamed(Routes.TENANT, arguments: [
            {"isOwner": false}
          ]);
        }else{
          Get.rootDelegate
              .offNamed(Routes.ADMINS, );
        }
      }


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
  TextEditingController registerationEndDate = TextEditingController();
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

  bool isValidPassword(String password) {
    return password.length >= 8;
  }

}
