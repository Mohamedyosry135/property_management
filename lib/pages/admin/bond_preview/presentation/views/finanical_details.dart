import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/bond_preview/presentation/controllers/bond_preview_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/widgets/custom_drop_down_widget.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';

import '../../../../../consts/colors.dart';
import '../../../../../consts/text_styles.dart';

class FinancialDetails extends GetView<BondPreviewController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(
          height: 8.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              AppAssets.dollarCircle(),
              color: Color(ColorCode.blue),
            ),
            const SizedBox(
              width: 8,
            ),
            CustomText(
              text: CommonLang.financialStatements.tr(),
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
              // SizedBox(
              //   width: 150.w,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       CustomText(
              //           text: "${CommonLang.rentalCycle.tr()}",
              //           textStyle: TextStyles.textMedium18.copyWith(
              //               fontWeight: FontWeight.w500,
              //               fontSize: 12,
              //               color: Colors.black.withOpacity(.6))),
              //       SizedBox(
              //         height: 8,
              //       ),
              //       Obx(() => CustomDropDownWidget<String>(
              //           value: controller.typeFinancial.value,
              //           items: controller.typeFinancialList ?? [],
              //
              //           onChange: (val) {
              //             controller.contractPaymentRequestList.value =
              //             List<ContractPaymentRequest>.filled(
              //                 0, ContractPaymentRequest(),
              //                 growable: true);
              //
              //             controller.rentController.text = "";
              //             controller.taxAmountController.text = "";
              //
              //             controller.finanicalRequest.taxAmount = 0;
              //
              //             controller.finanicalRequest.tammemPercentage = 0;
              //             controller.tmmPrecentage.text = "";
              //
              //             controller.typeFinancial.value = val ?? "";
              //
              //             int size = 0;
              //             if (controller.typeFinancial.value ==
              //                 CommonLang.select.tr()) {
              //               size = 0;
              //             } else if (controller.typeFinancial.value ==
              //                 CommonLang.monthly.tr()) {
              //               size = 12;
              //             } else if (controller.typeFinancial.value ==
              //                 CommonLang.quarterly.tr()) {
              //               size = 4;
              //             } else if (controller.typeFinancial.value ==
              //                 CommonLang.midterm.tr()) {
              //               size = 2;
              //             } else if (controller.typeFinancial.value ==
              //                 CommonLang.annual.tr()) {
              //               size = 1;
              //             }
              //
              //             for (int i = 0; i < size; i++) {
              //               controller.contractPaymentRequestList.value.add(ContractPaymentRequest(
              //                 nameController: TextEditingController(),
              //                 paymentDeadlineController: TextEditingController(text: DateFormat('yyyy-MM-dd').format(controller.startDateTime?.add(Duration(days: 30 * i )) ?? DateTime.now())),
              //                 paymentDeadline: DateFormat('yyyy-MM-dd').format(controller.startDateTime?.add(Duration(days: 30 * (i + 1))) ?? DateTime.now()),
              //                 pricelineController: TextEditingController(),
              //                 taxController: TextEditingController(),
              //               ));
              //
              //
              //             }
              //
              //             for (int i = 0; i < controller.contractPaymentRequestList.value.length; i++) {
              //               controller.contractPaymentRequestList.value[i].name = "الدفعة ${i+1}";
              //               controller.contractPaymentRequestList.value[i].nameController?.text = "الدفعة ${i+1}";
              //             }
              //
              //
              //             controller.update();
              //           }))
              //     ],
              //   ),
              // ),
              SizedBox(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: "${CommonLang.valueRent.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    CustomTextFieldContainer(CustomTextFormField(
                      hint: CommonLang.valueRent.tr(),
                      onSave: (String? val) {
                        controller.finanicalEdit.price = int.parse(val!);
                      },
                      controller: controller.rentController,
                      onChange: (String? val) {
                        controller.taxAmountController.text = ((double.tryParse(val == "" ? "0" : val!)! * controller.tax!) / 100) .toString();

                        controller.finanicalEdit.taxAmount = (double.tryParse(val!) ?? 0 * controller.tax!) / 100;
                      },

                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                      ],
                      inputType: TextInputType.number,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return CommonLang.notEmpty.tr();
                        }
                        return null;
                      },
                    ))
                  ],
                ),
              ),
              SizedBox(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: "${CommonLang.vat.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    CustomTextFieldContainer(CustomTextFormField(
                      hint: CommonLang.tax.tr(),
                      controller: controller.taxAmountController,
                      onSave: (String? val) {
                        controller.finanicalEdit.taxAmount =
                            double.parse(val!);
                      },
                      readOnly: true,
                      enabled: false,

                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                      ],
                      inputType: TextInputType.number,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return CommonLang.notEmpty.tr();
                        }
                        return null;
                      },
                    ))
                  ],
                ),
              ),
              SizedBox(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: "${CommonLang.electricityCharges.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    CustomTextFieldContainer(CustomTextFormField(
                      hint: CommonLang.electricityCharges.tr(),
                      onSave: (String? val) {
                        controller.finanicalEdit.electricityTax =
                            int.tryParse(val!);
                      },

                      controller: controller.electricityTax,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                      ],
                      inputType: TextInputType.number,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return CommonLang.notEmpty.tr();
                        }
                        return null;
                      },
                    ))
                  ],
                ),
              ),
              SizedBox(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: "${CommonLang.waterFee.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    CustomTextFieldContainer(CustomTextFormField(
                      hint: CommonLang.waterFee.tr(),
                      onSave: (String? val) {
                        controller.finanicalEdit.waterTax =
                            int.tryParse(val!);
                      },
                      controller: controller.waterTax,
                      // enabled: false,

                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                      ],
                      inputType: TextInputType.text,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return CommonLang.notEmpty.tr();
                        }
                        return null;
                      },
                    ))
                  ],
                ),
              ),

            ],
          ),
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
                        text: "${CommonLang.cleaningFee.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    CustomTextFieldContainer(CustomTextFormField(
                      hint: CommonLang.cleaningFee.tr(),
                      onSave: (String? val) {
                        controller.finanicalEdit.cleaningTax =
                            int.tryParse(val!);
                      },
                      controller: controller.cleaningTax,
                      // enabled: false,

                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                      ],
                      inputType: TextInputType.text,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return CommonLang.notEmpty.tr();
                        }
                        return null;
                      },
                    ))
                  ],
                ),
              ),
              SizedBox(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: "${CommonLang.administrativeFees.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    CustomTextFieldContainer(CustomTextFormField(
                      hint: CommonLang.administrativeFees.tr(),
                      controller: controller.adminstrativeFee,
                      onSave: (String? val) {
                        controller.finanicalEdit.managementTax =
                            double.tryParse(val!);
                      },
                      readOnly: false,

                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                      ],
                      inputType: TextInputType.number,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return CommonLang.notEmpty.tr();
                        }
                        return null;
                      },
                    ))
                  ],
                ),
              ),
              SizedBox(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: "${CommonLang.tamamCompanyPrecentage.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    CustomTextFieldContainer(CustomTextFormField(
                      hint: CommonLang.tamamCompanyPrecentage.tr(),
                      readOnly: false,
                      controller: controller.tmmPrecentage,
                      onSave: (String? val) {
                        controller.finanicalEdit.tammemPercentage =
                            double.tryParse(val!);
                      },
                      onChange: (String? val) {
                        controller.finanicalEdit.tammemPercentage =
                            double.tryParse(val!);
                      },
                      suffixIcon: Icon(Icons.percent),
                      inputType: TextInputType.number,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return CommonLang.notEmpty.tr();
                        }
                        return null;
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
