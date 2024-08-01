import 'package:device_info_plus/device_info_plus.dart';
import 'package:property_managment/config/ConfigReader.dart';
import 'package:property_managment/consts/storage.dart';
import 'package:property_managment/consts/themes.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/lang/user_translation_service.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';
import 'package:property_managment/shared/logger/logger_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main()async{
  await GetStorage.init(StorageKeys.userDataBox);
  await GetStorage.init(StorageKeys.appLanguage);
  await GetStorage.init(StorageKeys.validTimeDataBox);
  await GetStorage.init(StorageKeys.updateProfileBox);



  Get.put(AuthService());
  mainCommon();

}


void  mainCommon() async {


  Get.put(AuthService());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(CommonMain());
}

class CommonMain extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(720, 876),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return GetMaterialApp.router(
          debugShowCheckedModeBanner: false,
          enableLog: true,
          logWriterCallback: Logger.write,
          theme: Themes.light,
          themeMode: ThemeMode.light,
          getPages: AppPages.routes,

          locale: Locale(AuthService.to.language != null
              ? AuthService.to.language.toString()
              : 'ar'),
          fallbackLocale: Locale(AuthService.to.language ??"ar"),
          supportedLocales: const [Locale('ar', ''), Locale('en', '')],
          translations: MyLanguages(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
