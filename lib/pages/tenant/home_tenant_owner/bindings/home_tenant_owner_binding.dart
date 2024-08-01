import 'package:get/get.dart';

import '../data/home_tenant_owner_api_provider.dart';
import '../data/home_tenant_owner_repository.dart';
import '../presentation/controllers/home_tenant_owner_controller.dart';

class HomeTenantOwnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IHomeTenantOwnerProvider>(HomeTenantOwnerProvider());
    Get.put<IHomeTenantOwnerRepository>(HomeTenantOwnerRepository(provider: Get.find()));
    Get.put(HomeTenantOwnerController(homeTenantOwnerRepository: Get.find(), ));
  }
}
