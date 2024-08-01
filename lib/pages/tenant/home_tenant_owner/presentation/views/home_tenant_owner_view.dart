import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:property_managment/pages/tenant/home_tenant_owner/presentation/controllers/home_tenant_owner_controller.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/widgets/custom_build_widget.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_widgets.dart';

class HomeTenantOwnerView extends GetView<HomeTenantOwnerController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomBuildWidget(
      index: 0,
      onChange: (String? val){
        print("dfssfd  ${val!}");
        controller.contractModel.value =  controller.onSeachContract(val);
        print(controller.contractModel.value.length);
      },
      onDelete:(){
        controller.contractModel.value =  controller.realContractModel;
        print(controller.contractModel.value.length);
        print("DELETE");

      },
      viewPage: Padding(
        padding: EdgeInsets.all(12.r),

        child: controller.obx((state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  AppAssets.home(),
                  color: Color(ColorCode.blue),
                ),
                const SizedBox(
                  width: 8,
                ),
                CustomText(
                  text: CommonLang.home.tr(),
                  textAlign: TextAlign.start,
                  textStyle: TextStyles.textMedium18.copyWith(
                    color: Color(ColorCode.blue),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Obx(() => DataTable(
                      border: TableBorder.all(width: 0, color: Colors.transparent),
                      decoration: BoxDecoration(
                        color: Color(ColorCode.blue),
                        border: Border.all(width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      columns: <DataColumn>[
                        dateColumn(CommonLang.contractNumber.tr()),
                        dateColumn(CommonLang.lessor.tr()),
                        dateColumn(CommonLang.tenant.tr()),
                        dateColumn(CommonLang.realEstate.tr()),
                        dateColumn(CommonLang.contractStartingDate.tr()),
                        dateColumn(CommonLang.contractEndDate.tr()),
                        dateColumn(""),

                        // dateColumn(""),
                      ],
                      rows: controller.contractModel.value.map((e) => dataRow(e)).toList() ?? [],

                    )),
                  ),
                )),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),onLoading: SpinKitCircle(color: Color(ColorCode.primary),)),
      ),
    );
  }

  DataRow dataRow(ContractModel item) {
    return DataRow(
      color: const MaterialStatePropertyAll(Colors.white),
      cells: <DataCell>[
        dataCell(item.contractNumber.toString()),
        dataCell(item.ownerName?? ""),
        dataCell(item.renterName?? ""),
        dataCell(controller.realStatesLit.firstWhereOrNull((element) => element.id == item.realStateId)?.name ?? ""),
        dataCell(item.startDate ?? ""),
        dataCell(item.endDate ?? ""),
        preveiwCell(()=>Get.rootDelegate.offNamed(Routes.BondsForUserView,parameters: {"id":item.id.toString()})),


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
