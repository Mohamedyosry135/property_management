import 'package:get/get.dart';

import '../data/representative_owners_tenants_api_provider.dart';
import '../data/representative_owners_tenants_repository.dart';
import '../presentation/controllers/representative_owners_tenants_controller.dart';

class RepresentativeOwnersTenantsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IRepresentativeOwnersTenantsProvider>(RepresentativeOwnersTenantsProvider(), );
    Get.put<IRepresentativeOwnersTenantsRepository>(RepresentativeOwnersTenantsRepository(provider: Get.find()), );
    Get.put(RepresentativeOwnersTenantsController( representativeOwnersTenatsRepository: Get.find()), );
  }
}
