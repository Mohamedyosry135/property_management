import 'package:get/get.dart';

import '../data/bond_preview_api_provider.dart';
import '../data/bond_preview_repository.dart';
import '../presentation/controllers/bond_preview_controller.dart';

class BondPreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IBondPreviewProvider>(BondPreviewProvider());
    Get.put<IBondPreviewRepository>(BondPreviewRepository(provider: Get.find()));
    Get.put(BondPreviewController(bondPreviewRepository: Get.find()));
  }
}
