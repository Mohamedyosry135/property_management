import 'package:get/get.dart';
import 'package:property_managment/pages/admin/buildings/data/buildings_api_provider.dart';
import 'package:property_managment/pages/admin/buildings/data/buildings_repository.dart';
import 'package:property_managment/pages/admin/buildings/presentation/controllers/buildings_controller.dart';
import 'package:property_managment/pages/admin/control_board/data/control_board_api_provider.dart';
import 'package:property_managment/pages/admin/control_board/data/control_board_repository.dart';
import 'package:property_managment/pages/admin/control_board/presentation/controllers/control_board_controller.dart';
import 'package:property_managment/pages/admin/owners_tenants/data/owners_tenants_api_provider.dart';
import 'package:property_managment/pages/admin/owners_tenants/data/owners_tenants_repository.dart';
import 'package:property_managment/pages/admin/owners_tenants/presentation/controllers/owners_tenants_controller.dart';
import 'package:property_managment/pages/common/profile/data/profile_api_provider.dart';
import 'package:property_managment/pages/common/profile/data/profile_repository.dart';
import 'package:property_managment/pages/common/profile/presentation/controllers/profile_controller.dart';
import 'package:property_managment/pages/common/support/data/support_api_provider.dart';
import 'package:property_managment/pages/common/support/data/support_repository.dart';
import 'package:property_managment/pages/common/support/presentation/controllers/support_controller.dart';

import '../data/home_api_provider.dart';
import '../data/home_repository.dart';
import '../presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IHomeProvider>(HomeProvider());
    Get.put<IHomeRepository>(HomeRepository(provider: Get.find()));
    Get.put(  HomeController(homeRepository: Get.find()));



  }
}
