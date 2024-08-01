import 'package:get/get.dart';

import '../data/add_building_api_provider.dart';
import '../data/add_building_repository.dart';
import '../presentation/controllers/add_building_controller.dart';

class AddBuildingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IAddBuildingProvider>(AddBuildingProvider());
    Get.put<IAddBuildingRepository>(AddBuildingRepository(provider: Get.find()));
    Get.put(AddBuildingController(addBuildingRepository: Get.find()));
  }
}
