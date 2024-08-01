import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/buildings/presentation/controllers/buildings_controller.dart';
import 'package:property_managment/pages/admin/control_board/presentation/controllers/control_board_controller.dart';
import 'package:property_managment/pages/admin/owners_tenants/presentation/controllers/owners_tenants_controller.dart';
import 'package:property_managment/pages/common/maintenance_requests/model/maintaenance_requests_model.dart';
import 'package:property_managment/pages/common/maintenance_requests/presentation/controllers/maintenance_requests_controller.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';
import 'package:property_managment/widgets/custom_build_widget.dart';
import 'package:property_managment/widgets/custom_button.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_widgets.dart';


class MaintenanceRequestsView extends GetView<MaintenanceRequestsController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomBuildWidget(
        index:
           AuthService.to.userInfo?.result?.data?.role == "admin"?  7 : 1,
        viewPage: controller.obx((state) => Scaffold(
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
                            AppAssets.maintaince(),
                            color: Color(ColorCode.blue),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          CustomText(
                            text: CommonLang.maintenanceRequests.tr(),
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
                              . offNamed(Routes.ADD_MAINTAINCE_REQUESTS_VIEW);
                          if (response != null) {
                            controller.getMaintenanceRequests();
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
                                text: CommonLang.maintenanceRequest.tr(),
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
                  controller.maintenanceRequestsModel != null  ?
                  Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: DataTable(
                            border: TableBorder.all(
                                width: 0, color: Colors.transparent),
                            decoration: BoxDecoration(
                              color: Color(ColorCode.blue),
                              border:
                              Border.all(width: 1, color: Colors.transparent),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            columns: <DataColumn>[
                              dateColumn(CommonLang.orderNumber.tr()),
                              dateColumn(CommonLang.contractNumber.tr()),
                              dateColumn(CommonLang.tenant.tr()),
                              dateColumn(CommonLang.mobileNumber.tr()),
                              dateColumn(CommonLang.orderDate.tr()),
                              dateColumn(CommonLang.orderDetails.tr()),
                              dateColumn(CommonLang.orderStatus.tr()),
                              // dateColumn(""),
                            ],
                            rows: controller.maintenanceRequestsModel!.data!
                                .map((e) => dataRow(e))
                                .toList() ??
                                [],
                          ),
                        ),
                      )):CustomText(text: "خطأ", textStyle: TextStyles.textBold18),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            )),onLoading: SpinKitCircle(color: Color(ColorCode.primary),)));
  }

  DataRow dataRow(RequestData model) {
    return DataRow(
      color: MaterialStatePropertyAll(Colors.white),
      cells: <DataCell>[
        dataCell(model.id?.toString() ?? ""),
        dataCell(model.contractNumber ??""),//model.contractNumber ??""
        dataCell(model.renterName ??""),
        dataCell(model.renterPhone ??""),
        dataCell(model.requestDate??""),//model.orderData ??""
        dataCell(model.details ?? ""),
        dataCell(model.status ?? ""),
        // lastDataCell("", onTap: () async {
        //   // var response = await Get.rootDelegate. offNamed(
        //   //     Routes.ADD_MAINTAINCE_REQUESTS_VIEW,
        //   //     arguments: {"requestData": model});
        //   // if (response != null) {
        //   //   controller.getMaintenanceRequests();
        //   // }
        // }),
      ],
    );
  }
}
