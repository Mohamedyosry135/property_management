import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/pages/admin/owners_tenants/presentation/controllers/owners_tenants_controller.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/widgets/custom_build_widget.dart';
import 'package:property_managment/widgets/custom_button.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_widgets.dart';

class TenantsView extends GetView<OwnersTenatsController> {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomBuildWidget(
      index:4 ,
      onChange: (String? val){
        print("dfssfd  ${val!}");
        controller.users.value =  controller.onSeachContract(val);
        print(controller.users.value.length);
      },
      onDelete:(){
        controller.users.value =  controller.realUsers;
        print(controller.users.value.length);
        print("DELETE");

      },
      viewPage: Scaffold(
          backgroundColor: Color(ColorCode.gray4),
          body: Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          AppAssets.owners(),
                          color: Color(ColorCode.blue),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomText(
                          text:  CommonLang.tenants.tr(),
                          textAlign: TextAlign.start,
                          textStyle: TextStyles.textMedium18.copyWith(
                            color: Color(ColorCode.blue),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    CustomButton(
                      onPressed: () async{
                        await Get.rootDelegate. offNamed(
                            Routes.ADD_TENANT_OWNER,
                            arguments: [
                              {"isOwner": "renter"}
                            ]).then((value){
                              controller.getUsers(controller.isOwner!);
                        });
                      },
                      backGroundColor: const Color(ColorCode.blue),
                      width: 140.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.add()),
                          SizedBox(
                            width: 4.w,
                          ),
                          CustomText(
                              text:  CommonLang.addTenant.tr(),
                              textStyle: TextStyles.textMedium18.copyWith(
                                  fontSize: 14,
                                  overflow: TextOverflow.fade,
                                  color: const Color(ColorCode.white),
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                controller.obx(
                        (state) => Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Obx(() => DataTable(
                              border: TableBorder.all(
                                  width: 0, color: Colors.transparent),
                              decoration: BoxDecoration(
                                color: Color(ColorCode.blue),
                                border: Border.all(
                                    width: 1, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              columns: <DataColumn>[
                                dateColumn(CommonLang.tenant.tr()),
                                dateColumn(CommonLang.idNumber.tr()),
                                dateColumn(CommonLang.mobileNumber.tr()),
                                dateColumn(CommonLang.email.tr()),
                                dateColumn(CommonLang.dateOfBirth.tr()),
                                dateColumn(CommonLang.signNumber.tr()),
                                dateColumn(CommonLang.signEndDate.tr()),
                                dateColumn(""),

                              ],
                              rows: controller.users
                                  .map((e) => dataRow(e))
                                  .toList(),
                            )),
                          ),
                        )),
                    onLoading: SpinKitCircle(
                  color: Color(ColorCode.blue),
                ),
                    onError: (String? err) => Center(
                      child: CustomText(
                        text: "حصل خطأ ما ",
                        textStyle: TextStyles.textBold25
                            .copyWith(fontSize: 26, color: Color(ColorCode.blue)),
                      ),
                    )
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          )),
    );

  }

  DataRow dataRow(Users user) {
    return DataRow(
      color: MaterialStatePropertyAll(Colors.white),
      cells: <DataCell>[
        dataCell(user.name ?? ""),
        dataCell(convertArabicToEnglish(user.verificationId ?? "")),
        dataCell(convertArabicToEnglish(user.phone ?? "")),
        dataCell(user.email ?? ""),
        dataCell(convertArabicToEnglish(user.birthdate ?? "")),
        dataCell(convertArabicToEnglish(user.realstateNumber ?? "")),
        dataCell(convertArabicToEnglish(user.realstateEndsDate ?? "")),
        lastDataCell("", onTap: () {
          Get.rootDelegate. offNamed(Routes.DELETEUSER,parameters: {'user': jsonEncode(user)});
        }),
      ],
    );
  }
}
