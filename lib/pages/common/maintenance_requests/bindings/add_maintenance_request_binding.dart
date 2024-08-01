import 'package:get/get.dart';
import 'package:property_managment/pages/common/maintenance_requests/presentation/controllers/add_maintenance_request_controller.dart';

import '../data/maintenance_requests_api_provider.dart';
import '../data/maintenance_requests_repository.dart';
import '../presentation/controllers/maintenance_requests_controller.dart';

class MaintenanceRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IMaintenanceRequestsProvider>(MaintenanceRequestsProvider());
    Get.put<IMaintenanceRequestsRepository>(MaintenanceRequestsRepository(provider: Get.find()));
    Get.put(AddMaintenanceRequestController(maintenanceRequestsRepository: Get.find(), ));
  }
}
