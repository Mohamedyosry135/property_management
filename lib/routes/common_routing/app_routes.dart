part of 'app_pages.dart';

abstract class Routes {
  static const SPLASH = '/';
  static const LOGIN = '/login';
  static const ADMINS = '/admins';


  static const HOME_VIEW = '/homeView';
  static const MAINTAINCE_REQUESTS_VIEW = '/maintainceRequestsView';
  static const PROFILE = '/profile';

  static var SUPPORT_CHAT ='/support-chat';
  static var ADD_MAINTAINCE_REQUESTS_VIEW ='/addMaintainceRequestsView';
  static var HOME_TENANT_OWNER_VIEW ='/homeTenantOwnerView';

  static const CONTROLL_bOARD_VIEW = '/control-board-view';
  static const OWNER = "/owner";
  static const TENANT= '/tenant';
  static const OWNER_REPRESENTATIVE= '/owner-representative';
  static const TENANT_REPRESENTATIVE= '/tenant-representative';
  static const REALESTATES= '/realestates';
  static const DELETEUSER= '/deleteUser';


  static const ADD_TENANT_OWNER = '/addTenantOrOwner';
  static const ADD_REPRESENTATIVE_TENANT_OWNER = '/addRepresentativeTenantOrOwner';
  static const ADD_BUILDING= '/addBuilding';
  static const CREATE_CONTRACT= '/createContract';
  static const BOND_PREVIEW= '/bondPreview';
static const BondsForUserView = '/bonds-for-contract/';
}
