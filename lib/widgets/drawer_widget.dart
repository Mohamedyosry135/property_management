import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';
import 'package:property_managment/widgets/custom_text.dart';

import '../consts/text_styles.dart';
import 'package:universal_html/html.dart' as html;

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key? key, required this.index, required this.width, this.onTap}) : super(key: key);

  int index;
  double width;
  var onTap;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List<String> titles = [
    CommonLang.controlBoard.tr(),
    CommonLang.admins.tr(),
    "${CommonLang.renter.tr()} (${CommonLang.owner.tr()})",
    CommonLang.representativeRenter.tr(),
    CommonLang.tenants.tr(),
    CommonLang.tenantRepresentative.tr(),
    CommonLang.realEstate.tr(),
    CommonLang.maintenanceRequests.tr(),
    CommonLang.personalPage.tr(),
    CommonLang.signOut.tr()
  ];

  List<String> iconPaths = [
    AppAssets.controllBoard(),
    AppAssets.owners(),
    AppAssets.owners(),
    AppAssets.actOnwer(),
    AppAssets.owners(),
    AppAssets.actOnwer(),
    AppAssets.building(),
    AppAssets.maintaince(),
    AppAssets.profileIcon(),
    AppAssets.exit(),
  ];

  List<String> titlesNotAdmin = [
    CommonLang.home.tr(),
    CommonLang.maintenanceRequests.tr(),
    CommonLang.personalPage.tr(),
    CommonLang.support.tr(),
    CommonLang.signOut.tr()
  ];

  List<String> iconPathsNotAdmin = [
    AppAssets.home(),
    AppAssets.maintaince(),
    AppAssets.profileIcon(),
    AppAssets.support(),
    AppAssets.exit(),
  ];


  RxInt pageSelected = 0.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageSelected = widget.index.obs;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: widget.width,//MediaQuery.of(context).size.width*.17,
      backgroundColor: const Color(ColorCode.white),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(widget.width ==90)  SizedBox(height: 30.h),

              // if(widget.width ==90)Padding(
              //     padding: const EdgeInsets.symmetric(
              //         horizontal: 12, vertical: 4),
              //     child: InkWell(
              //         onTap: widget.onTap,
              //         child: Image.asset(AppAssets.menu())),
              //     ),
              SizedBox(height: 30.h),
             if( AuthService.to.userInfo?.result?.data?.role == "admin")
                   ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: titles.length,
                      itemBuilder: (context, index) {
                        return cardItemWidget(titles[index], iconPaths[index],
                            () async{
                            if (index == 0) {
                              print("qwerwr0 ${AuthService.to.userInfo?.result?.data?.role}");
                              Get.rootDelegate
                                  .offNamed(Routes.CONTROLL_bOARD_VIEW);
                            }
                            else if (index == 1) {
                              print("qwerwr1 ${AuthService.to.userInfo?.result?.data?.role}");

                              Get.rootDelegate
                                  . offNamed(Routes.ADMINS,);
                            }
                            else if (index == 2) {
                              print("qwerwr1 ${AuthService.to.userInfo?.result?.data?.role}");

                              Get.rootDelegate
                                  . offNamed(Routes.OWNER, arguments: [
                                {"isOwner": true}
                              ]);
                            } else if (index == 3) {
                              print("qwerwr2 ${AuthService.to.userInfo?.result?.data?.role}");

                              Get.rootDelegate.offNamed(
                                  Routes.OWNER_REPRESENTATIVE,
                                  arguments: [
                                    {"isRepresentativeOwner": true}
                                  ]);
                            } else if (index == 4) {
                              print("qwerwr3 ${AuthService.to.userInfo?.result?.data?.role}");

                              Get.rootDelegate
                                  .offNamed(Routes.TENANT, arguments: [
                                {"isOwner": false}
                              ]);
                            } else if (index == 5) {
                              print("qwerwr4 ${AuthService.to.userInfo?.result?.data?.role}");

                              Get.rootDelegate.offNamed(
                                  Routes.TENANT_REPRESENTATIVE,
                                  arguments: [
                                    {"isRepresentativeOwner": false}
                                  ]);
                            } else if (index == 6 ){
                              print("qwerwr5 ${AuthService.to.userInfo?.result?.data?.role}");

                              Get.rootDelegate.offNamed(
                                  Routes.REALESTATES,
                                  );
                            } else if (index == 7) {
                              print("qwerwr6 ${AuthService.to.userInfo?.result?.data?.role}");

                              Get.rootDelegate.offNamed(Routes.MAINTAINCE_REQUESTS_VIEW
                              );
                            } else if (index == 8) {
                              print("qwerwr7 ${AuthService.to.userInfo?.result?.data?.role}");

                              Get.rootDelegate.offNamed(
                                  Routes.PROFILE
                              );
                            }else if (index == 9) {
                              print("qwerwr8 ${AuthService.to.userInfo?.result?.data?.role}");

                              await AuthService.to.logout();
                            }
                        }, index, true);
                      }),
                   if( AuthService.to.userInfo?.result?.data?.role =="renter" || AuthService.to.userInfo?.result?.data?.role =="owner")
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: titlesNotAdmin.length,
                      itemBuilder: (context, index) {
                        return cardItemWidget(
                            titlesNotAdmin[index], iconPathsNotAdmin[index],
                            () async{
                              if (index == 0) {
                                print("qwerwr00 ${AuthService.to.userInfo?.result?.data?.role}");

                                Get.rootDelegate
                                    .offNamed(Routes.HOME_TENANT_OWNER_VIEW);
                              }
                              else if (index == 1) {
                                print("qwerwr11 ${AuthService.to.userInfo?.result?.data?.role}");

                                Get.rootDelegate.offNamed(Routes.MAINTAINCE_REQUESTS_VIEW, );
                              }
                              else if (index == 2) {
                                print("qwerwr22 ${AuthService.to.userInfo?.result?.data?.role}");

                                Get.rootDelegate.offNamed(Routes.PROFILE,
);
                              }
                              else if (index == 3) {
                                print("qwerwr33 ${AuthService.to.userInfo?.result?.data?.role}");

                                Get.rootDelegate.offNamed(Routes.SUPPORT_CHAT, arguments: [
                                  {"isOwner": false}
                                ]);
                              }
                              else if (index == 4) {
                                print("qwerw44 ${AuthService.to.userInfo?.result?.data?.role}");

                                 AuthService.to.logout();

                              }
                            }, index, false);
                      })
            ],
          ),
        ),
      ),
    );
  }

  cardItemWidget(
      String title, String iconPath, onTap, int index, bool isAdmin) {
    return Obx(() => Container(
          margin: EdgeInsets.only(
              top: isAdmin
                  ? index == 9
                      ? 40
                      : 10
                  : index == 4
                      ? 40
                      : 10),
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(pageSelected.value == index
                  ? ColorCode.blue
                  : ColorCode.white)),
          child: InkWell(
            onTap: onTap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment:  widget.width !=90 ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: [
                Image.asset(
                  iconPath,
                  color: Color(pageSelected.value == index
                      ? ColorCode.white
                      : ColorCode.gray3),
                ),
              if(widget.width !=90)  const SizedBox(
                  width: 4,
                ),
                if(widget.width !=90) CustomText(
                  text: title,
                  textAlign: TextAlign.start,

                  textStyle: TextStyles.textMedium18.copyWith(
                    color: Color(pageSelected.value == index
                        ? ColorCode.white
                        : ColorCode.gray3),
                    overflow: TextOverflow.fade,
                    fontSize: 14,

                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
