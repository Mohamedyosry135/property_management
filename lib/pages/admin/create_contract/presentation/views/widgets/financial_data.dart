import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_payment_request.dart';
import 'package:property_managment/pages/admin/create_contract/presentation/controllers/create_contract_controller.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/widgets/custom_drop_down_widget.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';

class FinancialData extends GetView<CreateContractController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(
          height: 30.h,
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
              Obx(() => IgnorePointer(
                ignoring:controller.isEnabled2.value,
                child: SizedBox(
                  width: 150.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: "${CommonLang.rentalCycle.tr()}",
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black.withOpacity(.6))),
                      SizedBox(
                        height: 8,
                      ),
                      CustomDropDownWidget<String>(
                          value: controller.typeFinancial.value,
                          items: controller.typeFinancialList ?? [],

                          onChange: (val) {
                            controller.startDateTime =    DateTime.parse(controller.contractRequest.startDate!);
                            print("dshdsfdsds ${ controller.startDateTime.toString()}");

                            print("dshdsfdsds ${ controller.numberOfYears?.value}");
                            controller.contractPaymentRequestList.value =
                            List<ContractPaymentRequest>.filled(
                                0, ContractPaymentRequest(),
                                growable: true);

                            controller.rentController.text = "";
                            controller.taxAmountController.text = "";

                            controller.finanicalRequest.taxAmount = 0;

                            controller.finanicalRequest.tammemPercentage = 0;
                            controller.tmmPrecentage.text = "";

                            controller.typeFinancial.value = val ?? "";

                            int size = 0;
                            int typeOfPayment =0;
                            if (controller.typeFinancial.value ==
                                CommonLang.select.tr()) {
                              size = 0;
                              typeOfPayment = 0;
                            } else if (controller.typeFinancial.value ==
                                CommonLang.monthly.tr()) {
                              size = 12 * controller.numberOfYears!.value;
                              typeOfPayment = 1;
                            } else if (controller.typeFinancial.value ==
                                CommonLang.quarterly.tr()) {
                              size = 4* controller.numberOfYears!.value;
                              typeOfPayment = 3;
                            } else if (controller.typeFinancial.value ==
                                CommonLang.midterm.tr()) {
                              size = 2* controller.numberOfYears!.value;
                              typeOfPayment = 6;
                            } else if (controller.typeFinancial.value ==
                                CommonLang.annual.tr()) {
                              size = 1* controller.numberOfYears!.value;
                              typeOfPayment = 12;

                            }

                            for (int i = 0; i < size; i++) {
                              controller.contractPaymentRequestList.value.add(ContractPaymentRequest(
                                nameController: TextEditingController(),
                                paymentDeadlineController: TextEditingController(text: DateFormat('yyyy-MM-dd').format(
                                    controller.startDateTime ??DateTime.now()
                                  // DateTime( controller.startDateTime!.year,  controller.startDateTime!.month+1, controller.startDateTime!.day)
                                )
                                ),
                                paymentDeadline: DateFormat('yyyy-MM-dd').format(
                                    controller.startDateTime ??DateTime.now()

                                  // DateTime( controller.startDateTime!.year,  controller.startDateTime!.month+1, controller.startDateTime!.day)
                                ),
                                pricelineController: TextEditingController(),
                                taxController: TextEditingController(),
                              ));

                              if(i ==0){
                                controller.startDateTime = DateTime( controller.startDateTime!.year,  controller.startDateTime!.month+typeOfPayment, controller.startDateTime!.day -1);

                              }else{
                                controller.startDateTime = DateTime( controller.startDateTime!.year,  controller.startDateTime!.month+typeOfPayment, controller.startDateTime!.day );

                              }

                            }

                            for (int i = 0; i < controller.contractPaymentRequestList.value.length; i++) {
                              controller.contractPaymentRequestList.value[i].name = "الدفعة ${i+1}";
                              controller.contractPaymentRequestList.value[i].nameController?.text = "الدفعة ${i+1}";
                            }


                            controller.update();
                          })
                    ],
                  ),
                ),
              )),
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
                        controller.finanicalRequest.price = int.parse(val!);
                      },
                      controller: controller.rentController,
                      onChange: (String? val) {
                        controller.taxAmountController.text = ((double.tryParse(val == "" ? "0" : val!)! * controller.taxPercentage!) / 100) .toString();

                        controller.finanicalRequest.taxAmount = (double.tryParse(val!) ?? 0 * controller.taxPercentage!) / 100;

                        // controller.finanicalRequest
                        //     .tammemPercentage =
                        //     (double.tryParse(val!) ??0 *20.0) /100;
                        // controller.tmmPrecentage.text = ((double.tryParse(val!)! *(20.0/100.0))).toString();

                        for (int i = 0; i < controller.contractPaymentRequestList.value.length; i++) {
                          controller.contractPaymentRequestList.value[i].pricelineController!.text = ((double.tryParse(val == "" ? "0" : val) ?? 0) / controller.contractPaymentRequestList.value.length).toString();
                          controller.contractPaymentRequestList.value[i].taxController!.text = ((double.tryParse(controller.taxAmountController.text) ?? 0) / controller.contractPaymentRequestList.value.length).toString();
                          print(controller.contractPaymentRequestList.value[i].pricelineController?.text);
                        }
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
                        controller.finanicalRequest.taxAmount =
                            double.parse(val!);
                      },
                      readOnly: true,
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
                        controller.finanicalRequest.electricityTax =
                            int.tryParse(val!);
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
                        text: "${CommonLang.waterFee.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    CustomTextFieldContainer(CustomTextFormField(
                      hint: CommonLang.waterFee.tr(),
                      onSave: (String? val) {
                        controller.finanicalRequest.waterTax =
                            int.tryParse(val!);
                      },
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
                        text: "${CommonLang.cleaningFee.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    CustomTextFieldContainer(CustomTextFormField(
                      hint: CommonLang.cleaningFee.tr(),
                      onSave: (String? val) {
                        controller.finanicalRequest.cleaningTax =
                            int.tryParse(val!);
                      },
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
                        controller.finanicalRequest.managementTax =
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
                        controller.finanicalRequest.tammemPercentage =
                            double.tryParse(val!);
                      },
                      onChange: (String? val) {
                        controller.finanicalRequest.tammemPercentage =
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
