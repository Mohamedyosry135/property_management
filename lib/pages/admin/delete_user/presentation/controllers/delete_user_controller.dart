import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/delete_user/models/user_update_model.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';
import '../../../owners_tenants/models/users.dart';
import '../../data/delete_user_repository.dart';

class DeleteUserController extends SuperController<dynamic> {
  DeleteUserController({required this.deleteUserRepository});
  IDeleteUserRepository deleteUserRepository;
  Users? user;
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fileController = TextEditingController();
  TextEditingController fileExpireDateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  UserUpdateModel userUpdateModel = UserUpdateModel();
  Future onDeleteUser() async {
    change(false,status: RxStatus.loading());
    try {
      http.Response response = await deleteUserRepository.deleteUser(user!.id!);
      print(response.body);
      if(response.statusCode == 200){
        Get.snackbar("", CommonLang.deletedSuccessfully.tr());
        change(true,status: RxStatus.success());
        if(user?.role == "admin"){
          Get.rootDelegate.offNamed(Routes.ADMINS);
        }else if(user?.role == "owner"){
          Get.rootDelegate.offNamed(Routes.OWNER,arguments: [
            {"isOwner": true}
          ]);
        }
        else if(user?.role == "owner_representer"){
          Get.rootDelegate.offNamed(Routes.OWNER_REPRESENTATIVE,arguments: [
            {"isRepresentativeOwner": true}
          ]);
        }else if(user?.role == "renter"){
          Get.rootDelegate.offNamed(Routes.TENANT,arguments: [
            {"isOwner": false}
          ]);
        }else if(user?.role == "renter_representer"){
          Get.rootDelegate.offNamed(Routes.TENANT_REPRESENTATIVE,arguments: [
            {"isRepresentativeOwner": false}
          ]);
        }



      }
      else{
        change(true,status: RxStatus.success());
        Get.snackbar('error', jsonDecode(response.body)['message']);
      }
    } catch (e) {
      change(true,status: RxStatus.success());
      rethrow;
    }
  }

  @override
  void onInit() {
    if( AuthService.to.userInfo ==null){
       AuthService.to.logout().then((value){
        Get.rootDelegate.offNamed(Routes.LOGIN);
        Get.rootDelegate.backUntil(Routes.LOGIN);
      });

    }
    user = Users.fromJson(
        jsonDecode(Get.rootDelegate.parameters['user'].toString()));
    nameController.text = user?.name ?? '';
    idController.text = user?.verificationId ?? '';
    birthDateController.text = user?.birthdate ?? '';
    phoneController.text = user?.phone ?? '';
    fileController.text = user?.realstateNumber ?? '';
    fileExpireDateController.text = user?.realstateEndsDate ?? '';
    emailController.text = user?.email ?? '';
    print("user ${user?.role}");

    change(true, status: RxStatus.success());
    super.onInit();
  }

  Future onEditUser() async {
    userUpdateModel.name = nameController.text;
    userUpdateModel.phone = phoneController.text;
    userUpdateModel.email = emailController.text;
    userUpdateModel.verificationId = idController.text;
    userUpdateModel.birthdate = birthDateController.text;
    userUpdateModel.realstateNumber =fileController.text;
    userUpdateModel.realstateEndsDate = fileExpireDateController.text;
    print("USER BEFORE EDIT ${user?.toJson()}");
    print(" EDIT ${userUpdateModel.toJson()}");
    change(false,status: RxStatus.loading());
    try {
     int  resp= await deleteUserRepository.updateUser(user!.id!,userUpdateModel);
      if(resp==200){
        Get.snackbar("", CommonLang.editedSuccesssfully.tr());

        user?.role == "owner" ||  user?.role == "admin"? Get.rootDelegate
            . offNamed(Routes.OWNER, arguments: [
          {"isOwner": true}
        ]): user?.role == "renter" ? Get.rootDelegate
            . offNamed(Routes.OWNER, arguments: [
          {"isOwner": false}
        ]): user?.role == "owner_representer" ? Get.rootDelegate.offNamed(
            Routes.OWNER_REPRESENTATIVE,
            arguments: [
              {"isRepresentativeOwner": true}
            ]):Get.rootDelegate.offNamed(
            Routes.OWNER_REPRESENTATIVE,
            arguments: [
              {"isRepresentativeOwner": false}
            ]);
        change(true,status: RxStatus.success());
      }
      else{
        change(true,status: RxStatus.success());
        Get.snackbar('خطأ', "حدث خطأ ما");
      }
    } catch (e) {
      change(true,status: RxStatus.success());
      rethrow;
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
