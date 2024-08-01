import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/buildings/presentation/controllers/buildings_controller.dart';
import 'package:property_managment/pages/admin/control_board/presentation/controllers/control_board_controller.dart';
import 'package:property_managment/pages/admin/owners_tenants/presentation/controllers/owners_tenants_controller.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/widgets/custom_build_widget.dart';
import 'package:property_managment/widgets/custom_button.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_widgets.dart';

class BuildingsView extends GetView<BuildingsController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomBuildWidget(
        index: 6,
        onChange: (String? val){
          print("dfssfd  ${val!}");
          controller.realStatesLit.value =  controller.onSeachContract(val);
          print(controller.realStatesLit.value.length);
        },
        onDelete:(){
          controller.realStatesLit.value =  controller.realRealStatesLit;
          print(controller.realStatesLit.value.length);
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
                            AppAssets.building(),
                            color: Color(ColorCode.blue),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          CustomText(
                            text: CommonLang.realEstate.tr(),
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
                        onPressed: () async {
                          var response = await Get.rootDelegate
                              . offNamed(Routes.ADD_BUILDING);
                          if (response != null) {
                            controller.getRealStates();
                          }
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
                                text: CommonLang.addRealEstate.tr(),
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
                  controller.obx((state) {
                    return Expanded(
                        child: SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Obx(() => DataTable(
                          border: TableBorder.all(
                              width: 0, color: Colors.transparent),
                          decoration: BoxDecoration(
                            color: const Color(ColorCode.blue),
                            border:
                            Border.all(width: 1, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          columns: <DataColumn>[
                            dateColumn(CommonLang.propertyName.tr()),
                            dateColumn(CommonLang.ownerOfProperty.tr()),
                            dateColumn(CommonLang.instrumentNumber.tr()),
                            dateColumn(CommonLang.city.tr()),
                            dateColumn(CommonLang.district.tr()),
                            dateColumn(CommonLang.propertyUse.tr()),
                            dateColumn(CommonLang.propertyType.tr()),
                            dateColumn(""),
                          ],
                          rows: controller.realStatesLit.value
                              .map((e) => dataRow(e))
                              .toList(),
                        )),
                      ),
                    ));
                  },
                      onLoading:
                          const SpinKitCircle(color: Color(ColorCode.blue))),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            )));
  }

  DataRow dataRow(RealStatesModel realStatesModel) {
    return DataRow(
      color: MaterialStatePropertyAll(Colors.white),
      cells: <DataCell>[
        dataCell(realStatesModel.name ?? ""),
        dataCell(
            convertArabicToEnglish(realStatesModel.ownerId.toString() ?? "")),
        dataCell(convertArabicToEnglish(realStatesModel.identifier ?? "")),
        dataCell(realStatesModel.city.toString() ?? ""),
        dataCell(realStatesModel.neighborhood.toString() ?? ""),
        dataCell(realStatesModel.usageType.toString() ?? ""),
        dataCell(realStatesModel.type.toString() ?? ""),
        lastDataCell(realStatesModel.type.toString() ?? "", onTap: () async {
          var response = await Get.rootDelegate. offNamed(
              Routes.ADD_BUILDING,
              arguments: {"realStatesModel": realStatesModel});
          if (response != null) {
            controller.getRealStates();
          }
        }),
      ],
    );
  }
}
