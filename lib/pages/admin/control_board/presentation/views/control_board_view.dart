import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:property_managment/pages/admin/control_board/presentation/controllers/control_board_controller.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/widgets/custom_build_widget.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_widgets.dart';

class ControlBoardView extends GetView<ControlBoardController> {
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
      viewPage: controller.obx((state) => Scaffold(
          backgroundColor: Color(ColorCode.gray4),
          body: controller.obx((state) => Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start  ,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      AppAssets.controllBoard(),
                      color: Color(ColorCode.blue),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomText(
                      text: CommonLang.controlBoard.tr(),
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
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: cardPrecentage(CommonLang.totalOwners.tr(), double.tryParse(controller.ownerCount.toString()) ?? 0.0,
                          Color(ColorCode.pink) , double.tryParse((controller.ownerCount+ controller.renterCount ).toString()) ?? 0.0),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: cardPrecentage(CommonLang.totalTenants.tr(),  double.tryParse(controller.renterCount.toString()) ??0.0,
                          Color(ColorCode.green),double.tryParse((controller.ownerCount + controller.renterCount ).toString()) ?? 0.0),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: cardPrecentage(CommonLang.realstateCount.tr(),
                          double.tryParse(controller.realstateCount.toString()) ??0.0, Color(ColorCode.orange) ,100),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                        child: cardPrecentage(CommonLang.contractCount.tr(),
                            double.tryParse(controller.contractCount.toString()) ??0.0, Color(ColorCode.purble),100)),
                    SizedBox(
                      width: 8.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                controller.obx((state){
                  return Expanded(
                      child: SingleChildScrollView(
                        child: Obx(() => Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          width: double.infinity,
                          child: DataTable(
                            border: TableBorder.all(width: 0,color: Colors.transparent),
                            decoration: BoxDecoration(
                              color: Color(ColorCode.blue),
                              border: Border.all(width: 1,color: Colors.transparent),
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
                            ],
                            rows: controller.contractModel.value.map((e) => dataRow(e)).toList() ?? [],
                          ),
                        )),
                      ));
                },onLoading: SpinKitCircle(color: Color(ColorCode.blue),)),

                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),onLoading: SpinKitCircle(color: Color(ColorCode.blue),))),onLoading: SpinKitCircle(color: Color(ColorCode.primary),)),
    );

  }

  cardPrecentage(String title, double precentage, Color color, double total) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
          color: Color(ColorCode.white),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  textAlign: TextAlign.start,
                  textStyle: TextStyles.textMedium18.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(ColorCode.gray5)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomText(
                  text: "${precentage}",
                  textStyle: TextStyles.textBold25.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(ColorCode.black2)),
                )
              ],
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          CircularPercentIndicator(
            radius: 15.0.w,
            lineWidth: 10,
            backgroundColor: Color(ColorCode.gray6),
            percent: title == CommonLang.realstateCount.tr() || title == CommonLang.contractCount.tr()? 1 :precentage / total,
            progressColor: color,
          )
        ],
      ),
    );
  }

  DataRow dataRow(ContractModel item) {
    return DataRow(
      color: const MaterialStatePropertyAll(Colors.white),
      cells: <DataCell>[
        dataCell(item.contractNumber.toString()),
        dataCell(item.ownerName ?? ""),
        dataCell(item.renterName ?? ""),
        dataCell(controller.realStatesLit.firstWhereOrNull((element) => element.id == item.realStateId)?.name ?? ""),
        dataCell(item.startDate ?? ""),
        dataCell(item.endDate ?? ""),
        lastDataCellWithClick ("",(){
          Get.rootDelegate. offNamed(Routes.BOND_PREVIEW, parameters: {'id': item.id.toString()});
        }),
      ],
    );
  }
}
