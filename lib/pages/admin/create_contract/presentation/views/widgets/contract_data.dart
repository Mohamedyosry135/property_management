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
import 'package:property_managment/pages/admin/create_contract/presentation/controllers/create_contract_controller.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/widgets/custom_drop_down_widget.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';

import '../../../models/contract_payment_request.dart';

class ContractData extends GetView<CreateContractController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              AppAssets.note(),
              color: Color(ColorCode.blue),
            ),
            const SizedBox(
              width: 8,
            ),
            CustomText(
              text: CommonLang.contractData.tr(),
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
                        text: "${CommonLang.contractNumber.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    CustomTextFieldContainer(CustomTextFormField(
                      hint: '',
                      onSave: (String? val) {
                        controller.contractRequest.contractNumber = val!;
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
                        text: "${CommonLang.contractStartingDate.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    CustomTextFieldContainer(CustomTextFormField(
                      hint: '',
                      onSave: (String? val) {},
                      controller: controller.startDate,
                      readOnly: true,
                      onChange: (String? val) {},
                      onTap: () async {
                        controller.startDateTime = await controller.pickDate(context);
                        print(controller.startDateTime);
                        if (controller.startDateTime != null) {
                          controller.isEnabled2.value = true;
                          controller.contractPaymentRequestList.value =
                          List<ContractPaymentRequest>.filled(
                              0, ContractPaymentRequest(),
                              growable: true);

                          controller.rentController.text = "";
                          controller.taxAmountController.text = "";

                          controller.finanicalRequest.taxAmount = 0;

                          controller.finanicalRequest.tammemPercentage = 0;
                          controller.tmmPrecentage.text = "";

                          controller.typeFinancial.value =  "";

                          controller.numberOfYears.value = 1;
                          controller.contractRequest.endDate=  "";
                          controller.endDate.text = "";

                          DateFormat formatter = DateFormat('yyyy-MM-dd');
                          String formattedDate = formatter.format(controller.startDateTime ?? DateTime.now());
                          controller.startDate.text = formattedDate;
                          controller.contractRequest.startDate = formattedDate;
                          controller.isEnabled.value = controller.startDate.text.isEmpty;
                          print("controller.isEnabled.value ${controller.isEnabled.value}");


                          DateFormat formatter2 = DateFormat('yyyy-MM-dd');
                          String formattedDate2 = formatter2.format(controller.startDateTime?.add(Duration(days:365 )) ?? DateTime.now());
                          controller.endDate.text =formattedDate2;
                          controller.contractRequest.endDate=  formattedDate2;

                          controller.isEnabled2.value =  controller.endDate.text.isEmpty;
                          // for (int i = 0; i < controller.contractPaymentRequestList.value.length; i++) {
                          //   controller
                          //       .contractPaymentRequestList
                          //       .value[i]
                          //       .paymentDeadlineController
                          //       ?.text = formattedDate;
                          // }
                        }
                      },
                      inputType: TextInputType.datetime,
                      suffixIcon: Image.asset(AppAssets.calendar()),
                    ))
                  ],
                ),
              ),
              Obx(() => IgnorePointer(
                ignoring: controller.isEnabled.value,
                child: SizedBox(
                  width: 150.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: "${CommonLang.numberOfYears.tr()}",
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black.withOpacity(.6))),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomDropDownWidget<int?>(
                          value: controller.numberOfYears?.value ,
                          items: controller.years ?? [],
                          // onRemove: () {
                          //   controller.numberOfYears?.value =null;
                          // },

                          onChange: (val) {
                            controller.startDateTime =    DateTime.parse(controller.contractRequest.startDate!);

                            controller.numberOfYears.value = val!;
                            controller.contractPaymentRequestList.value =
                            List<ContractPaymentRequest>.filled(
                                0, ContractPaymentRequest(),
                                growable: true);

                            controller.rentController.text = "";
                            controller.taxAmountController.text = "";

                            controller.finanicalRequest.taxAmount = 0;

                            controller.finanicalRequest.tammemPercentage = 0;
                            controller.tmmPrecentage.text = "";

                            controller.typeFinancial.value =  "";
                            controller.isEnabled2.value =  true;
                            if(controller.numberOfYears.value != 0){

                              DateFormat formatter = DateFormat('yyyy-MM-dd');
                              String formattedDate = formatter.format(controller.startDateTime?.add(Duration(days:365 *val)) ?? DateTime.now());
                              controller.endDate.text =formattedDate;
                              controller.contractRequest.endDate=  formattedDate;

                              controller.isEnabled2.value =  controller.endDate.text.isEmpty;


                            }


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
                        text: "${CommonLang.contractEndDate.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    CustomTextFieldContainer(CustomTextFormField(
                      hint: '',
                      onSave: (String? val) {},
                      controller: controller.endDate,
                      readOnly: true,
                      enabled: false,
                      onTap: () async {
                        DateTime? dateTime = await controller.pickDate(context);
                        print(dateTime);
                        if (dateTime != null) {
                          DateFormat formatter = DateFormat('yyyy-MM-dd');
                          String formattedDate = formatter.format(dateTime);
                          controller.endDate.text = formattedDate;
                          controller.contractRequest.endDate = formattedDate;
                        }
                      },
                      inputType: TextInputType.datetime,
                      suffixIcon: Image.asset(AppAssets.calendar()),
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
