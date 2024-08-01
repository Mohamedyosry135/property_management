import 'package:get/get.dart';

import '../data/maintenance_requests_api_provider.dart';
import '../data/maintenance_requests_repository.dart';
import '../presentation/controllers/maintenance_requests_controller.dart';

class MaintenanceRequestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IMaintenanceRequestsProvider>(MaintenanceRequestsProvider(),);
    Get.put<IMaintenanceRequestsRepository>(MaintenanceRequestsRepository(provider: Get.find(),),);
    Get.put(MaintenanceRequestsController(maintenanceRequestsRepository: Get.find(), ),);
  }
}
