import 'package:get/get.dart';
import 'package:property_managment/pages/admin/delete_user/data/delete_user_provider.dart';
import 'package:property_managment/pages/admin/delete_user/data/delete_user_repository.dart';
import 'package:property_managment/pages/admin/delete_user/presentation/controllers/delete_user_controller.dart';

class DeleteUSerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IDeleteUserProvider>(DeleteUserProvider());
    Get.put<IDeleteUserRepository>(DeleteUserRepository(provider: Get.find()));
    Get.put(DeleteUserController(deleteUserRepository: Get.find()));
  }
}
