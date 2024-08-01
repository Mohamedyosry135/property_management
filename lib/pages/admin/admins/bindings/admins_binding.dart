import 'package:get/get.dart';

import '../data/admins_api_provider.dart';
import '../data/admins_repository.dart';
import '../presentation/controllers/admins_controller.dart';

class AdminsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IAdminsProvider>(AdminsProvider(), );
    Get.put<IAdminsRepository>(AdminsRepository(provider: Get.find()), );
    Get.put(AdminsController(adminsRepository: Get.find()), );
  }
}
