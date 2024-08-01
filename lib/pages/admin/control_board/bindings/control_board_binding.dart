import 'package:get/get.dart';

import '../data/control_board_api_provider.dart';
import '../data/control_board_repository.dart';
import '../presentation/controllers/control_board_controller.dart';

class ControlBoardBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<IControlBoardProvider>(ControlBoardProvider(), );
    Get.put<IControlBoardRepository>(ControlBoardRepository(provider: Get.find()), );
    Get.put(ControlBoardController(controlBoardRepository: Get.find()), );
  }
}
