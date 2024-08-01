import 'package:get/get.dart';

import '../data/create_contract_api_provider.dart';
import '../data/create_contract_repository.dart';
import '../presentation/controllers/create_contract_controller.dart';

class CreateContractBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<ICreateContractProvider>(CreateContractProvider());
    Get.put<ICreateContractRepository>(CreateContractRepository(provider: Get.find()));
    Get.put(CreateContractController(createContractRepository: Get.find()));
  }
}
