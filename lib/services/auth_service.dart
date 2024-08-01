import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:property_managment/consts/storage.dart';
 
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:property_managment/pages/common/login/models/login_response_model.dart';
import 'package:property_managment/pages/common/profile/models/update_profile_model.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:universal_html/html.dart' as html;


class AuthService extends GetxService {
  static AuthService get to => Get.find();
  GetStorage box = GetStorage(StorageKeys.userDataBox);
  GetStorage box2 = GetStorage(StorageKeys.appLanguage);
  GetStorage box3 = GetStorage(StorageKeys.validTimeDataBox);
  GetStorage box4 = GetStorage(StorageKeys.userDataBox);

  final isLoggedIn = false.obs;
  final isSelectedLanguage = false.obs;
  LoginResponseModel? userInfo;
  UpdateProfile? updateProfileProfile;
  // ImageModel? imageModel;
    String? language = 'ar';
  bool get isLoggedInValue => isLoggedIn.value;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  WebBrowserInfo? webBrowserInfo ;
  final cookieManager = WebviewCookieManager();
  @override
  void onInit() async{
    super.onInit();
    if(kIsWeb){
      webBrowserInfo= await deviceInfo.webBrowserInfo;
    }

    if (box.hasData(StorageKeys.userDataKey)) {
      print("isLoggedInValue ${isLoggedInValue}");
      isLoggedIn.value = true;
      userInfo = LoginResponseModel.fromJson(box.read(StorageKeys.userDataKey));
    }
    if (box4.hasData(StorageKeys.updateProfileKey)) {
      print("isLoggedInValue ${box4.read(StorageKeys.updateProfileKey)}");

      updateProfileProfile = UpdateProfile.fromJson(box4.read(StorageKeys.updateProfileKey));
    }
    print("box2.hasData ${box2.hasData(StorageKeys.appLanguage)}");
    if (box2.hasData(StorageKeys.appLanguage)) {
      isSelectedLanguage.value = true;
      language = box2.read(StorageKeys.appLanguage);
    }
    // if (box3.hasData(StorageKeys.userImageDataKey)) {
    //   imageModel =ImageModel.fromJson( box3.read(StorageKeys.userImageDataKey));
    // }
  }

  void login(LoginResponseModel userInfo) {
    box.remove(StorageKeys.userDataKey);
    isLoggedIn.value = true;
    this.userInfo = userInfo;
    box.write(StorageKeys.userDataKey, userInfo.toJson());
  }
  void updateProfile(UpdateProfile updateProfile) {
    box4.remove(StorageKeys.updateProfileKey);
    // isLoggedIn.value = true;
    this.updateProfileProfile = updateProfile;
    box4.write(StorageKeys.updateProfileKey, updateProfile.toJson());
  }
  // void addImage(ImageModel imageModel) {
  //   if (box3.hasData(StorageKeys.userImageDataKey)) {
  //     box3.remove(StorageKeys.userImageDataKey);
  //   }
  //   this.imageModel = imageModel;
  //   box3.write(StorageKeys.userImageDataKey, imageModel.toJson());
  // }


  //
  // Future<void> clearLocalStorage() async {
  //
  //   final lastClearTime = box3.read(StorageKeys.validTimeDataBox) ?? 0;
  //   final currentTime = DateTime.now().millisecondsSinceEpoch;
  //   if (currentTime - lastClearTime >= 3 * 24 * 60 * 60 * 1000) {
  //     // Clear the storage and update the last clear time
  //     await box3.erase();
  //     await box3.write('lastClearTime', currentTime);
  //   }
  // }
  void clearCookies() async {

    await cookieManager.clearCookies();
  }
  bool isRefreshing = false;

  Future<void> logout() async{
    if (!isRefreshing) {
      isRefreshing = true;

      isLoggedIn.value = false;
    userInfo = null;
    // clearCookies();
   await  box.remove(StorageKeys.userDataKey);

    Get.rootDelegate.offAndToNamed(Routes.LOGIN);

    html.document.cookie?.split(';').forEach((cookie) {
      final eqPos = cookie.indexOf('=');
      final name = eqPos > -1 ? cookie.substring(0, eqPos) : cookie;
      html.document.cookie = '$name=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
    });
    Future.delayed(Duration(milliseconds: 100 )).then((value){
      html.window.location.reload();
    });

    }
  }
  void selectLanguage(languag) {
    isSelectedLanguage.value = true;
    language = languag;
    box2.write(StorageKeys.appLanguage, languag);
    print("selectLanguage ${(box2.hasData(StorageKeys.appLanguage))}");
  }
}
