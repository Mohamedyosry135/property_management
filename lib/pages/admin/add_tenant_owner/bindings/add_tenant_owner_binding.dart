import 'package:get/get.dart';

import '../data/add_tenant_owner_api_provider.dart';
import '../data/add_tenant_owner_repository.dart';
import '../presentation/controllers/add_tenant_owner_controller.dart';

class AddTenantOwnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IAddTenantOwnerProvider>(AddTenantOwnerProvider());
    Get.put<IAddTenantOwnerRepository>(AddTenantOwnerRepository(provider: Get.find()));
    Get.put(AddTenantOwnerController(addTenantOwnerRepository: Get.find()));
  }
}
