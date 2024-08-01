import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/create_contract/presentation/controllers/create_contract_controller.dart';
import 'package:property_managment/pages/admin/create_contract/presentation/views/widgets/building_data.dart';
import 'package:property_managment/pages/admin/create_contract/presentation/views/widgets/contract_data.dart';
import 'package:property_managment/pages/admin/create_contract/presentation/views/widgets/contract_parties.dart';
import 'package:property_managment/pages/admin/create_contract/presentation/views/widgets/financial_data.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/widgets/custom_button.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';
import 'package:property_managment/widgets/custom_widgets.dart';

class CreateContractView extends GetView<CreateContractController> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(ColorCode.gray4),
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.r),
              child: InkWell(
                onTap: () =>
                    Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW),
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
                AppAssets.note(),
              ),
              const SizedBox(
                width: 4,
              ),
              CustomText(
                text: CommonLang.createNewContract.tr(),
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
        backgroundColor: Color(ColorCode.white),
        body: controller.obx(
            (state) => Padding(
                  padding: EdgeInsets.all(50.r),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          ContractData(),
                          ContractParties(),
                          BuildingData(),
                          FinancialData(),
                         Obx(() =>  Align(
                           alignment: Alignment.centerRight,
                           child: Container(
                             width: double.infinity,
                             padding: EdgeInsets.symmetric(horizontal: 8),
                             child: DataTable(
                               border: TableBorder.all(
                                   width: 0, color: Colors.transparent),
                               decoration: BoxDecoration(
                                 color: Color(ColorCode.blue),
                                 border: Border.all(
                                     width: 1, color: Colors.transparent),
                                 borderRadius: BorderRadius.circular(12),
                               ),
                               columns: <DataColumn>[
                                 dateColumn(CommonLang.numberBatches.tr()),
                                 dateColumn(CommonLang.batchValue.tr()),
                                 dateColumn(CommonLang.tax.tr()),
                                 // dateColumn(CommonLang.totalFees.tr()),
                                 // dateColumn(CommonLang.total.tr()),
                                 dateColumn(CommonLang.duaDate.tr()),
                                 dateColumn(CommonLang.paymentMade.tr()),
                               ],
                               rows: controller
                                   .contractPaymentRequestList.value
                                   .map((e) {
                                 return dataRow(
                                     controller
                                         .contractPaymentRequestList.value
                                         .indexOf(e),
                                     context,
                                     e.paymentDeadlineController,
                                     e.isPaidRx);
                               }).toList(),
                               // rows: controller.contractPaymentRequestList.value.map((e) => dataRow(e, context)).toList(),
                             ),
                           ),
                         )),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: SizedBox(),
                              ),
                              controller.obx(
                                  (state) => CustomButton(
                                        onPressed: () {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();

                                          if ((formKey.currentState
                                                  ?.validate() ??
                                              false)) {
                                            formKey.currentState?.save();

                                            if (controller
                                                            .selectedLessor.value !=
                                                        Users() &&
                                                    controller.selectedOwner
                                                            .value !=
                                                        Users() &&
                                                    controller.selectedRealStatesModel
                                                            .value !=
                                                        RealStatesModel() &&
                                                    controller.startDate.text
                                                        .isNotEmpty &&
                                                    controller
                                                        .endDate.text.isNotEmpty
                                                // &&controller.paymentDeadline.text.isNotEmpty
                                                ) {
                                              // for(int i=0; i< controller.contractPaymentRequestList.value.length; i++){
                                              //   controller.contractPaymentRequestList.value[i].name  = controller.contractPaymentRequestList.value[i].nameController?.text;
                                              // }

                                              controller.onCreateContract();
                                            } else {
                                              Get.snackbar("حطأ",
                                                  CommonLang.notEmpty.tr());
                                            }
                                          }
                                        },
                                        height: 43.h,
                                        width: 100.w,
                                        backGroundColor:
                                            const Color(ColorCode.green),
                                        child: CustomText(
                                            text: CommonLang.createNewContract
                                                .tr(),
                                            textStyle: TextStyles.textMedium18
                                                .copyWith(
                                                    fontSize: 16,
                                                    color:
                                                        Color(ColorCode.white),
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                  onLoading: const SpinKitCircle(
                                      color: Color(ColorCode.blue))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            onLoading: SpinKitCircle(
              color: Color(ColorCode.blue),
            )));
  }

  DataRow dataRow(int index, context, TextEditingController? paymentDeadline,
      RxBool? isPaidRX) {
    paymentDeadline ??= TextEditingController();
    isPaidRX ??= false.obs;
    // controller.contractPaymentRequestList.value[index].paymentDeadlineController = TextEditingController();
    print("index ${index}");
    return DataRow(
      color: MaterialStatePropertyAll(Colors.white),
      cells: <DataCell>[
        DataCell(Container(
          constraints: BoxConstraints(maxWidth: 300, minWidth: 200),
          child: CustomTextFieldContainer(CustomTextFormField(
            hint: "",
            onSave: (String? val) {},
            controller:  controller.contractPaymentRequestList.value[index].nameController,
            onChange: (String? val) {
              print("index ${index}");
              controller.contractPaymentRequestList.value[index].name = val!;
              // print(controller.contractPaymentRequestList.value[index].name);
            },
            readOnly: true,
            inputType: TextInputType.text,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return CommonLang.notEmpty.tr();
              }
              return null;
            },
          )),
        )),

        DataCell(Container(
          alignment: Alignment.centerRight,
          constraints: BoxConstraints(maxWidth: 300, minWidth: 200),
          child: CustomTextFieldContainer(CustomTextFormField(
            hint: "",
            onSave: (String? val) {
              controller.contractPaymentRequestList.value[index].price =
                  double.tryParse(controller.contractPaymentRequestList
                          .value[index].pricelineController?.text ??
                      "0.0");
            },
            controller: controller
                .contractPaymentRequestList.value[index].pricelineController,
            readOnly: true,
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
          )),
        )),
        DataCell(Container(
          constraints: BoxConstraints(maxWidth: 300, minWidth: 200),
          child: CustomTextFieldContainer(CustomTextFormField(
            hint: "",
            onSave: (String? val) {
              controller.contractPaymentRequestList.value[index].taxAmount =
                  double.tryParse(controller.contractPaymentRequestList
                          .value[index].taxController?.text ??
                      "0.0");
            },
            controller: controller
                .contractPaymentRequestList.value[index].taxController,
            readOnly: true,
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
          )),
        )),
        // dataInputCell((String? val) {}),
        // dataInputCell((String? val) {}),
        DataCell(Container(
          width: 200,
          constraints: BoxConstraints(maxWidth: 300, minWidth: 100),
          child: CustomTextFieldContainer(CustomTextFormField(
            hint: '',
            onSave: (String? val) {},
            controller: controller.contractPaymentRequestList.value[index].paymentDeadlineController,
            //controller.contractPaymentRequestList.value[index].paymentDeadlineController,
            readOnly: true,
            inputType: TextInputType.datetime,
            suffixIcon: Image.asset(AppAssets.calendar()),
          )),
        )),
        DataCell(
          InkWell(
              onTap: () {
                // controller.isPaid.value = !controller.isPaid.value;
                isPaidRX!.value = !isPaidRX!.value;
                controller.contractPaymentRequestList.value[index].isPaid =
                    isPaidRX!.value;
                print("123 ${isPaidRX.value}");
                print(
                    "12345 ${controller.contractPaymentRequestList.value[index].isPaid}");
              },
              child: Obx(() => Icon(
                    isPaidRX!.value
                        ? Icons.radio_button_on
                        : Icons.radio_button_off,
                    color: isPaidRX!.value
                        ? Color(ColorCode.green)
                        : Color(ColorCode.gray2),
                  ))),
        )
      ],
    );
  }
}
