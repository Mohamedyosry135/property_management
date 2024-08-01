import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/common/profile/data/profile_repository.dart';
import 'package:property_managment/pages/common/profile/models/profile_data_model.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';
import 'package:property_managment/widgets/custom_widgets.dart';

import '../../../login/models/login_response_model.dart';

class ProfileController extends SuperController<dynamic> {
  ProfileController({required this.profileRepository});

  final IProfileRepository profileRepository;

  ProfileDataModel? profileData;

  String firstName = "",
      familyName = "",
      phone = "",
      email = "",
      currentPassword = "";
  TextEditingController firstNameController = TextEditingController();
  // TextEditingController familyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController newPasswordAgain = TextEditingController();

  RxBool isHiddenCurrentPassword = true.obs;

  changeIsHiddenCurrentPassword() => isHiddenCurrentPassword.toggle();
  RxBool isHiddenNewPassword = true.obs;

  changeIsHiddenNewPassword() => isHiddenNewPassword.toggle();
  RxBool isHiddenAgainPassword = true.obs;
  RxBool isLoading = false.obs;

  changeIsHiddenAgainPassword() => isHiddenAgainPassword.toggle();
  bool isValidPassword(String password) {
    return password.length >= 8;
  }
  Future fetchProfileData() async {
    change(false, status: RxStatus.loading());
    try {
      http.Response response = await profileRepository.fetchProfile();
      if (response.statusCode == 200) {
        print("response.statusCode ${response.statusCode}");
        Map decodedResponse = jsonDecode(response.body.toString());
        profileData = ProfileDataModel.fromJson(decodedResponse['data']);
        print(
            "jsonDecode(response.body)['data'] ${jsonDecode(response.body)['data']}");
        firstNameController.text = profileData?.name ?? '';
        // familyNameController.text = profileData?.name?.split(' ').last ?? '';
        emailController.text = profileData?.email ?? '';
        phoneController.text = convertArabicToEnglish(profileData?.phone ?? '');
        change(true, status: RxStatus.success());
      }
    } catch (e) {
      change(true, status: RxStatus.success());
      print("DF${e.toString()}");
      rethrow;
    }
  }

  updateProfile() {
    change(false, status: RxStatus.loading());
    profileRepository.editProfile(
      emailController.text,
      phone,
      firstNameController.text,// + familyNameController.text,
      profileData?.id ?? 0,
      newPassword.text
    ).then((value) async{
      change(true, status: RxStatus.success());
      if(newPassword.text.isNotEmpty) {
        await AuthService.to.logout().then((value) {
          Get.rootDelegate.backUntil(Routes.LOGIN);
        });
      }else{
        AuthService.to.userInfo?.result?.data?.name = "";
        AuthService.to.userInfo?.result?.data?.name = firstNameController.text;// + familyNameController.text;
        if (AuthService.to.userInfo?.result?.data?.role == "admin") {
          Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
        } else {
          Get.rootDelegate.offNamed(Routes.HOME_TENANT_OWNER_VIEW);
        }
      }
      Get.snackbar("", CommonLang.editedSuccesssfully.tr());
      // fetchProfileData();
    }).onError((error, stackTrace) {
      Get.snackbar(CommonLang.error.tr(), "");
      change(true, status: RxStatus.success());
      print("DF${error.toString()}");
    });
  }

  @override
  void onInit() async {
    if (AuthService.to.userInfo == null) {
      await AuthService.to.logout().then((value) {
        // Get.rootDelegate.offNamed(Routes.LOGIN);
        // Get.rootDelegate.backUntil(Routes.LOGIN);
      });
    }

    fetchProfileData();
    super.onInit();
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
