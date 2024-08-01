import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/bond_preview/models/contract_payments_bond_model.dart';
import 'package:property_managment/pages/tenant/bonds_for_user/presentation/controllers/bonds_for_user_controller.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_widgets.dart';

class BondsForUserView extends GetView<BondsForUserController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(ColorCode.white),
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.gray4),
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.r),
            child: InkWell(
              onTap: () =>
                  Get.rootDelegate.offNamed(Routes.HOME_TENANT_OWNER_VIEW),
              child: const Icon(
                Icons.close,
                color: Color(ColorCode.blue),
              ),
            ),
          )
        ],
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              AppAssets.people(),
            ),
            const SizedBox(
              width: 4,
            ),
            CustomText(
              text: CommonLang.contractDetails.tr(),
              textAlign: TextAlign.start,
              textStyle: TextStyles.textMedium18.copyWith(
                color: const Color(ColorCode.blue),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: controller.obx(
          (state) =>  Padding(
                  padding: EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(AuthService.to.userInfo?.result?.data?.role ==
                            "owner")
                        Column(
                          children: [
                            if (AuthService.to.userInfo?.result?.data?.role ==
                                "owner")
                              CustomText(
                                text: CommonLang.batchPreview.tr(),
                                textAlign: TextAlign.start,
                                textStyle: TextStyles.textMedium18.copyWith(
                                  color: const Color(ColorCode.blue),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            if (AuthService.to.userInfo?.result?.data?.role ==
                                "owner")
                              SizedBox(
                                height: 4,
                              ),
                            AuthService.to.userInfo?.result?.data?.role == "owner" &&
                                (controller.contractPaymentsBondModel?.data != null &&
                                    (controller.contractPaymentsBondModel?.data
                                        ?.isNotEmpty ??
                                        false))
                                ? Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width: double.infinity,
                                child: DataTable(
                                  border: TableBorder.all(
                                      width: 0, color: Colors.transparent),
                                  decoration: BoxDecoration(
                                    color: const Color(ColorCode.blue),
                                    border: Border.all(
                                        width: 1, color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  columns: <DataColumn>[
                                    dateColumn(CommonLang.batchName.tr()),
                                    dateColumn(CommonLang.date.tr()),
                                    dateColumn(CommonLang.amount.tr()),
                                    dateColumn(CommonLang.tax.tr()),
                                    dateColumn(CommonLang.total.tr()),
                                    dateColumn(CommonLang.status.tr()),
                                  ],
                                  rows: controller
                                      .contractPaymentsBondModel!.data!
                                      .map((e) => dataRow(e, context))
                                      .toList(),
                                ),
                              ),
                            )
                                : CustomText(
                              text: CommonLang.noBatchesFound.tr(),
                              textAlign: TextAlign.start,
                              textStyle: TextStyles.textMedium18.copyWith(
                                color: const Color(ColorCode.blue),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            if (AuthService.to.userInfo?.result?.data?.role ==
                                "owner")
                              SizedBox(
                                height: 30,
                              ),
                          ],
                        ),
                        CustomText(
                          text: CommonLang.bondPreview.tr(),
                          textAlign: TextAlign.start,
                          textStyle: TextStyles.textMedium18.copyWith(
                            color: const Color(ColorCode.blue),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        controller.contractPaymentsBonds?.data != null &&
                                (controller.contractPaymentsBonds?.data
                                        ?.isNotEmpty ??
                                    false)
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: DataTable(
                                    border: TableBorder.all(
                                        width: 0, color: Colors.transparent),
                                    decoration: BoxDecoration(
                                      color: const Color(ColorCode.blue),
                                      border: Border.all(
                                          width: 1, color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    columns: <DataColumn>[
                                      dateColumn(CommonLang.bondType.tr()),
                                      dateColumn(CommonLang.date.tr()),
                                      dateColumn(CommonLang.amount.tr()),
                                      dateColumn(CommonLang.tax.tr()),
                                      dateColumn(CommonLang.total.tr()),
                                      dateColumn(CommonLang.status.tr()),
                                    ],
                                    rows: controller.contractPaymentsBonds!.data!
                                        .map((e) => dataRow(e, context))
                                        .toList(),
                                  ),
                                ),
                              )
                            : CustomText(
                                text: CommonLang.noBondsFound.tr(),
                                textAlign: TextAlign.start,
                                textStyle: TextStyles.textMedium18.copyWith(
                                  color: const Color(ColorCode.blue),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                      ],
                    ),
                  ),
                ),
          onLoading: const SpinKitCircle(
            color: Color(ColorCode.blue),
          )),
    );
  }

  DataRow dataRow(ContractPayment item, context) {
    return  DataRow(
            color: const MaterialStatePropertyAll(Colors.white),
            cells: <DataCell>[
              dataCell(item.name ?? ""),
              dataCell(item.paymentDeadline ?? ""),
              dataCell(item.price.toString() ?? ""),
              dataCell(item.taxAmount.toString() ?? ""),
              dataCell(item.totalPrice.toString() ?? ""),
              dataCell(item.isPaid ?? false
                  ? CommonLang.paid.tr()
                  : CommonLang.notPaid.tr()),
            ],
          );
  }

  titleRow(String title, String value) {
    return Row(
      children: [
        CustomText(
          text: "${title}: ",
          textAlign: TextAlign.center,
          textStyle: TextStyles.textNormal25.copyWith(
            color: Color(ColorCode.primary),
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        CustomText(
          text: value,
          textAlign: TextAlign.center,
          textStyle: TextStyles.textNormal25.copyWith(
            color: Color(ColorCode.black),
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
