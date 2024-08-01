// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:property_managment/flavors/flavor_config.dart';
// import 'package:property_managment/pages/admin/buildings/presentation/views/buildings_view.dart';
// import 'package:property_managment/pages/admin/control_board/presentation/views/control_board_view.dart';
// import 'package:property_managment/pages/admin/owners_tenants/presentation/views/owners_tenants_view.dart';
// import 'package:property_managment/pages/admin/representative_owners_tenants/presentation/views/representative_owners_tenants_view.dart';
// import 'package:property_managment/pages/common/home/presentation/controllers/home_controller.dart';
// import 'package:property_managment/pages/common/home_page/presentation/views/home_page_view.dart';
// import 'package:property_managment/pages/common/maintenance_requests/presentation/views/maintenance_requests_view.dart';
// import 'package:property_managment/pages/common/profile/presentation/views/profile_view.dart';
// import 'package:property_managment/pages/common/support/presentation/views/support_view.dart';
// import 'package:property_managment/widgets/drawer_widget.dart';
// import 'package:property_managment/widgets/home_appbar.dart';
//
// class HomeView extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         // drawer: CustomDrawer(),
//         // endDrawerEnableOpenDragGesture: true,
//
//         // appBar: HomeAppBar(height: 60.h),
//         body: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//           Obx(() => controller.showMenu.value
//               ? const CustomDrawer()
//               : const SizedBox()),
//           Obx(() => Expanded(
//               flex: 4,
//               child: controller.myFlavorConfig.appNameEnum == AppNameEnum.admin
//                   ? buildBodyWidget(controller.pageSelected.value)
//                   : notAdminBuildBodyWidget(
//                       controller.pageSelected.value) //your child
//               ))
//         ]));
//   }
//
//   buildBodyWidget(int index) {
//     if (index == 0) {
//       return ControlBoardView();
//     } else if (index == 1) {
//       return const OwnersTenatsView(
//         isOwner: true,
//       );
//     } else if (index == 2) {
//       return const RepresentativeOwnersTenatsView(
//         isRepresentativeOwner: true,
//       );
//     } else if (index == 3) {
//       return const OwnersTenatsView(
//         isOwner: false,
//       );
//     } else if (index == 4) {
//       return const RepresentativeOwnersTenatsView(
//         isRepresentativeOwner: false,
//       );
//     } else if (index == 5) {
//       return BuildingsView();
//     } else if (index == 6) {
//       return MaintenanceRequestsView();
//     } else if (index == 7) {
//       return ProfileView();
//     }
//   }
//
//   notAdminBuildBodyWidget(int index) {
//     if (index == 0) {
//       return HomePageView();
//     } else if (index == 1) {
//       return MaintenanceRequestsView();
//     } else if (index == 2) {
//       return ProfileView();
//     }else if (index == 3) {
//       return SupportView();
//     }
//   }
// }
