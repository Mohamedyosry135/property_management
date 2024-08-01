import 'package:get/get.dart';

import '../data/bonds_for_user_api_provider.dart';
import '../data/bonds_for_user_repository.dart';
import '../presentation/controllers/bonds_for_user_controller.dart';

class BondsForUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IBondsForUserProvider>(BondsForUserProvider());
    Get.put<IBondsForUserRepository>(BondsForUserRepository(provider: Get.find()));
    Get.put(BondsForUserController(bondsForUserRepository: Get.find(), ));
  }
}
