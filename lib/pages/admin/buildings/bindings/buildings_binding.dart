import 'package:get/get.dart';

import '../data/buildings_api_provider.dart';
import '../data/buildings_repository.dart';
import '../presentation/controllers/buildings_controller.dart';

class BuildingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IBuildingsProvider>(BuildingsProvider());
    Get.put<IBuildingsRepository>(BuildingsRepository(provider: Get.find()));
    Get.put(BuildingsController(buildingsRepository: Get.find()));
  }
}
