import 'package:get/get.dart';
import '../data/support_api_provider.dart';
import '../data/support_repository.dart';
import '../presentation/controllers/support_controller.dart';

class SupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ISupportProvider>(SupportProvider());
    Get.put<ISupportRepository>(SupportRepository(provider: Get.find()));
    Get.put(SupportController(supportRepository: Get.find()));
  }
}
