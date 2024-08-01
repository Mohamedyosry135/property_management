import 'package:get/get.dart';
import '../data/login_api_provider.dart';
import '../data/login_repository.dart';
import '../presentation/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILoginProvider>(()=>LoginProvider());
    Get.lazyPut<ILoginRepository>(()=>LoginRepository(provider: Get.find()));
    Get.lazyPut(()=>LoginController(loginRepository: Get.find()));
  }
}
