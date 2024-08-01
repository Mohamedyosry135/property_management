import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';
import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.addRequestModifier<dynamic>((request) {
      final userInfo = AuthService.to.userInfo;
      final languageApp = AuthService.to.language;
      //
      // if (userInfo != null &&( userInfo.result?.data?.token?.isNotEmpty ?? false)) {
      //   print(userInfo.result?.data?.token);
      print("outside");
      if(userInfo !=null){
        print("inside");
        request.headers.putIfAbsent(
            "Authorization", () => ('${userInfo?.result?.data?.id.toString() ?? ""} ${userInfo?.result?.data?.token ?? ""}'));
      }


// print('Bearer ${userInfo?.data?.token ?? ""}');
      request.headers
          .putIfAbsent("Accept-Language", () => 'en-US');

      request.headers.putIfAbsent("Content-Type", () => 'application/json');
      request.headers.putIfAbsent("Accept", () => '*/*');



      print(request.url);
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      printInfo(info: request.url.toString());
      printInfo(info: response.bodyString!);
      if (response.unauthorized || response.status.code == 401) {
        AuthService.to.logout();
        Get.rootDelegate.offNamed(Routes.LOGIN);
        Get.rootDelegate.backUntil(Routes.LOGIN);

      }
      return response;
    });
  }
}
