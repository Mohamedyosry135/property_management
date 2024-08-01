import 'package:get/get.dart';

import '../data/add_representative_tenant_owner_api_provider.dart';
import '../data/add_representative_tenant_owner_repository.dart';
import '../presentation/controllers/add_representative_tenant_owner_controller.dart';

class AddRepresentativeTenantOwnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IAddRepresentativeTenantOwnerProvider>(AddRepresentativeTenantOwnerProvider());
    Get.put<IAddRepresentativeTenantOwnerRepository>(AddRepresentativeTenantOwnerRepository(provider: Get.find()));
    Get.put(AddRepresentativeTenantOwnerController(addRepresentativeTenantOwnerRepository: Get.find()));
  }
}
