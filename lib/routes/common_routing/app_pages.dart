import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:property_managment/pages/admin/admins/bindings/admins_binding.dart';
import 'package:property_managment/pages/admin/admins/presentation/views/admin_view.dart';
import 'package:property_managment/pages/common/home/bindings/home_binding.dart';
import 'package:property_managment/pages/common/home/presentation/views/home_view.dart';
import 'package:property_managment/pages/common/login/bindings/login_binding.dart';
import 'package:property_managment/pages/common/login/presentation/views/login_view.dart';
import 'package:property_managment/pages/common/maintenance_requests/bindings/add_maintenance_request_binding.dart';

import 'package:property_managment/pages/common/maintenance_requests/bindings/maintenance_requests_binding.dart';
import 'package:property_managment/pages/common/maintenance_requests/presentation/controllers/add_maintenance_request_controller.dart';
import 'package:property_managment/pages/common/maintenance_requests/presentation/views/add_maintenance_request_view.dart';
import 'package:property_managment/pages/common/maintenance_requests/presentation/views/maintenance_requests_view.dart';
import 'package:property_managment/pages/common/profile/bindings/profile_binding.dart';
import 'package:property_managment/pages/common/profile/presentation/views/profile_view.dart';
import 'package:property_managment/pages/common/splash/bindings/splash_binding.dart';
import 'package:property_managment/pages/common/splash/presentation/views/splash_view.dart';
import 'package:property_managment/pages/common/support/bindings/support_binding.dart';
import 'package:property_managment/pages/common/support/presentation/views/support_view.dart';
import 'package:property_managment/pages/tenant/bonds_for_user/bindings/bonds_for_user_binding.dart';
import 'package:property_managment/pages/tenant/bonds_for_user/presentation/views/bonds_for_user_view.dart';
import 'package:property_managment/pages/tenant/home_tenant_owner/bindings/home_tenant_owner_binding.dart';
import 'package:property_managment/pages/tenant/home_tenant_owner/presentation/controllers/home_tenant_owner_controller.dart';
import 'package:property_managment/pages/tenant/home_tenant_owner/presentation/views/home_tenant_owner_view.dart';
import 'package:property_managment/pages/admin/add_building/bindings/add_building_binding.dart';
import 'package:property_managment/pages/admin/add_building/presentation/views/add_building_view.dart';
import 'package:property_managment/pages/admin/add_representative_tenant_owner/bindings/add_representative_tenant_owner_binding.dart';
import 'package:property_managment/pages/admin/add_representative_tenant_owner/presentation/views/add_representative_tenant_owner_view.dart';
import 'package:property_managment/pages/admin/add_tenant_owner/bindings/add_tenant_owner_binding.dart';
import 'package:property_managment/pages/admin/add_tenant_owner/presentation/views/add_tenant_owner_view.dart';
import 'package:property_managment/pages/admin/bond_preview/bindings/bond_preview_binding.dart';
import 'package:property_managment/pages/admin/bond_preview/presentation/views/bond_preview_view.dart';
import 'package:property_managment/pages/admin/buildings/bindings/buildings_binding.dart';
import 'package:property_managment/pages/admin/buildings/presentation/views/buildings_view.dart';
import 'package:property_managment/pages/admin/control_board/bindings/control_board_binding.dart';
import 'package:property_managment/pages/admin/control_board/presentation/views/control_board_view.dart';
import 'package:property_managment/pages/admin/create_contract/bindings/create_contract_binding.dart';
import 'package:property_managment/pages/admin/create_contract/presentation/views/create_contract_view.dart';
import 'package:property_managment/pages/admin/delete_user/binding/delete_user_binding.dart';
import 'package:property_managment/pages/admin/delete_user/presentation/views/delete_user_view.dart';
import 'package:property_managment/pages/admin/owners_tenants/bindings/owners_tenants_binding.dart';
import 'package:property_managment/pages/admin/owners_tenants/presentation/views/owners_view.dart';
import 'package:property_managment/pages/admin/owners_tenants/presentation/views/tenants_view.dart';
import 'package:property_managment/pages/admin/representative_owners_tenants/bindings/representative_owners_tenants_binding.dart';
import 'package:property_managment/pages/admin/representative_owners_tenants/presentation/views/representative_owners_view.dart';
import 'package:property_managment/pages/admin/representative_owners_tenants/presentation/views/representative_tenants_view.dart';
import 'package:property_managment/pages/common/splash/bindings/splash_binding.dart';
import 'package:property_managment/pages/common/splash/presentation/views/splash_view.dart';


part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    // GetPage(
    //     name: Routes.SPLASH,
    //     page: () => SplashView(),
    //     binding: SplashBinding()),
    GetPage(
        name: Routes.LOGIN,
        page: () => LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.CONTROLL_bOARD_VIEW,
        page: () => ControlBoardView(),
        binding: ControlBoardBinding()),
    GetPage(
        name: Routes.HOME_TENANT_OWNER_VIEW,
        page: () => HomeTenantOwnerView(),
        binding: HomeTenantOwnerBinding()),
    // GetPage(
    //     name: Routes.HOME_VIEW,
    //     page: () => HomeView(),
    //     binding: HomeBinding()),
    GetPage(
        name: Routes.MAINTAINCE_REQUESTS_VIEW,
        page: () => MaintenanceRequestsView(),
        binding: MaintenanceRequestsBinding()),
    GetPage(
        name: Routes.PROFILE,
        page: () => ProfileView(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.SUPPORT_CHAT,
        page: () => SupportView(),
        binding: SupportBinding()),


    GetPage(
        name: Routes.OWNER,
        page: () => OwnersTenatsView(),
        binding: OwnersTenatsBinding()),
    GetPage(
        name: Routes.TENANT,
        page: () => TenantsView(),
        binding: OwnersTenatsBinding()),
    GetPage(
        name: Routes.OWNER_REPRESENTATIVE,
        page: () => RepresentativeOwnersView(),
        binding: RepresentativeOwnersTenantsBinding()),
    GetPage(
        name: Routes.TENANT_REPRESENTATIVE,
        page: () => RepresentativeTenantsView(),
        binding: RepresentativeOwnersTenantsBinding()),
    GetPage(
        name: Routes.REALESTATES,
        page: () => BuildingsView(),
        binding: BuildingsBinding()),
    GetPage(
        name: Routes.ADD_TENANT_OWNER,
        page: () => AddTenantOwnerView(),
        binding: AddTenantOwnerBinding()),
    GetPage(
        name: Routes.DELETEUSER,
        page: () => DeleteUserView(),
        binding: DeleteUSerBinding()),
    GetPage(
        name: Routes.ADD_REPRESENTATIVE_TENANT_OWNER,
        page: () => AddRepresentativeTenantOwnerView(),
        binding: AddRepresentativeTenantOwnerBinding()),
    GetPage(
        name: Routes.ADD_BUILDING,
        page: () => AddBuildingView(),
        binding: AddBuildingBinding()),
    GetPage(
        name: Routes.CREATE_CONTRACT,
        page: () => CreateContractView(),
        binding: CreateContractBinding()),
    GetPage(
        name: Routes.BOND_PREVIEW,
        page: () => BondPreviewView(),
        binding: BondPreviewBinding()),

    GetPage(
        name: Routes.ADD_MAINTAINCE_REQUESTS_VIEW,
        page: () => AddMaintenanceRequestView(),
        binding: MaintenanceRequestBinding()),
    GetPage(
        name: Routes.BondsForUserView,
        page: () => BondsForUserView(),
        binding: BondsForUserBinding()),
    GetPage(
        name: Routes.ADMINS,
        page: () => AdminsView(),
        binding: AdminsBinding()),



  ];
}
