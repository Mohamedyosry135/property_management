import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/create_contract/presentation/controllers/create_contract_controller.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/widgets/custom_drop_down_widget.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';

class BuildingData extends GetView<CreateContractController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              AppAssets.people(),
              color: Color(ColorCode.blue),
            ),
            const SizedBox(
              width: 8,
            ),
            CustomText(
              text: CommonLang.buildingData.tr(),
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
        Align(
          alignment: Alignment.centerRight,
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            children: [
              SizedBox(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: "${CommonLang.building.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    SizedBox(
                      height: 8,
                    ),
                    Obx(() => CustomDropDownWidget<RealStatesModel>(
                        value: controller.selectedRealStatesModel.value,
                        items: controller.realStatesLit ?? [],
                        // label: CommonLang.realEstate.tr(),
                        onRemove: () {
                          controller.selectedRealStatesModel.value =
                              RealStatesModel();
                          controller.update();
                        },
                        onChange: (val) {
                          // if(controller.isEditing){
                          //   controller.addMaintenanceRequest.realStateId = val?.id ?? -1;
                          // }
                          controller.selectedRealStatesModel.value = val!;
                          controller.update();
                        }))
                  ],
                ),
              ),


              // SizedBox(
              //   width: 150.w,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       CustomText(
              //           text: "${CommonLang.unitType.tr()}",
              //           textStyle: TextStyles.textMedium18.copyWith(
              //               fontWeight: FontWeight.w500,
              //               fontSize: 12,
              //               color: Colors.black.withOpacity(.6))),
              //       SizedBox(
              //         height: 8,
              //       ),
              //       Obx(() => CustomDropDownWidget<String>(
              //           value: controller.unitTypesSelected.value,
              //           items: controller.unitTypes ?? [],
              //           // label: CommonLang.realEstate.tr(),
              //           onRemove: () {
              //             controller.unitTypesSelected.value =
              //                 "";
              //             controller.update();
              //           },
              //           onChange: (val) {
              //             // if(controller.isEditing){
              //             //   controller.addMaintenanceRequest.realStateId = val?.id ?? -1;
              //             // }
              //             controller.unitTypesSelected.value = val!;
              //             controller.update();
              //           }))
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   width: 150.w,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       CustomText(
              //           text: "${CommonLang.unitArea.tr()}",
              //           textStyle: TextStyles.textMedium18.copyWith(
              //               fontWeight: FontWeight.w500,
              //               fontSize: 12,
              //               color: Colors.black.withOpacity(.6))),
              //       SizedBox(
              //         height: 8,
              //       ),
              //       CustomTextFieldContainer(
              //           CustomTextFormField(
              //             hint: CommonLang.unitArea
              //                 .tr(),
              //             onSave: (String? val) {
              //               controller.contractRequest
              //                   .area =
              //                   double.tryParse(val!);
              //             },
              //             inputFormatters: <TextInputFormatter>[
              //               FilteringTextInputFormatter.allow(
              //                   RegExp(r'\d+')),
              //             ],
              //             inputType: TextInputType.number,
              //             validator: (String? value) {
              //               if (value == null ||
              //                   value.isEmpty) {
              //                 return CommonLang.notEmpty.tr();
              //               }
              //               return null;
              //             },
              //           ))
              //
              //     ],
              //   ),
              // ),

              // SizedBox(
              //   width:150.w,
              //
              //
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       CustomText(
              //           text: "${ CommonLang.unitType.tr()}",
              //           textStyle: TextStyles.textMedium18.copyWith(
              //               fontWeight: FontWeight.w500,
              //               fontSize: 12,
              //               color: Colors.black.withOpacity(.6)
              //           )),
              //       CustomTextFieldContainer(
              //           CustomTextFormField(
              //             hint: '',
              //             onSave: (String? val) {
              //             },
              //             inputType: TextInputType.text,
              //
              //           )
              //       )
              //     ],
              //   ),
              // ),
              //
              // SizedBox(
              //   width:150.w,
              //
              //
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       CustomText(
              //           text: "${ CommonLang.unitArea.tr()}",
              //           textStyle: TextStyles.textMedium18.copyWith(
              //               fontWeight: FontWeight.w500,
              //               fontSize: 12,
              //               color: Colors.black.withOpacity(.6)
              //           )),
              //       CustomTextFieldContainer(
              //           CustomTextFormField(
              //             hint: '',
              //             onSave: (String? val) {
              //             },
              //             inputType: TextInputType.number,
              //
              //           )
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
