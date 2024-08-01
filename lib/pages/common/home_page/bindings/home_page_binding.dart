import 'package:get/get.dart';

import '../data/home_page_api_provider.dart';
import '../data/home_page_repository.dart';
import '../presentation/controllers/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IHomePageProvider>(HomePageProvider());
    Get.put<IHomePageRepository>(HomePageRepository(provider: Get.find()));
    Get.put(HomePageController(homePageRepository: Get.find()));
  }
}
