import 'package:get/get.dart';

import '../data/owners_tenants_api_provider.dart';
import '../data/owners_tenants_repository.dart';
import '../presentation/controllers/owners_tenants_controller.dart';

class OwnersTenatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IOwnersTenatsProvider>(OwnersTenatsProvider(), );
    Get.put<IOwnersTenatsRepository>(OwnersTenatsRepository(provider: Get.find()), );
    Get.put(OwnersTenatsController(ownersTenatsRepository: Get.find()), );
  }
}
