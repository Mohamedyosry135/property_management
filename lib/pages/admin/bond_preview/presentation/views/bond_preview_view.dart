import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/bond_preview/models/contract_payments_bond_model.dart';
import 'package:property_managment/pages/admin/bond_preview/models/edit_bond_field.dart';
import 'package:property_managment/pages/admin/bond_preview/presentation/controllers/bond_preview_controller.dart';
import 'package:property_managment/pages/admin/bond_preview/presentation/views/contract_details.dart';
import 'package:property_managment/pages/admin/bond_preview/presentation/views/finanical_details.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/widgets/custom_button.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';
import 'package:property_managment/widgets/custom_widgets.dart';

import 'bonds_details.dart';

class BondPreviewView extends GetView<BondPreviewController> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormState> formKeyEdit = GlobalKey();

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
            (state) => Padding(
                  padding: EdgeInsets.all(12.r),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                            key: controller.formKey2,
                            child: Column(
                              children: [
                                ContractDetails(),
                                FinancialDetails(),
                              ],
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            CustomButton(
                              onPressed: () {
                                // print("dfklshjfdjkhs ${controller.selectedLessor.value.id}");
                                controller.finanicalEdit.type = controller.financialDetails.type;
                                controller.contractEdit.financialId = controller.financialDetails.id;
                                controller.contractEdit.realStateId = controller.selectedRealStatesModel.value.id;
                                controller.contractEdit.ownerId = controller.selectedOwner.value.id;
                                controller.contractEdit.renterId = controller.selectedLessor.value.id;
                                controller.contractEdit.renterRepresenterId = controller.selectedRepresentativeLessor.value.id;
                                controller.contractEdit.ownerRepresenterId = controller.selectedRepresentativeOwner.value.id;
                                FocusManager.instance.primaryFocus?.unfocus();
                                if ((controller.formKey2.currentState?.validate() ??
                                    false)) {
                                  controller.formKey2.currentState?.save();
                                  if (controller.contractEdit.renterId == null ||controller.contractEdit.ownerId == null || controller.contractEdit.realStateId == null) {
                                    Get.snackbar("", CommonLang.fillRequiredFields.tr());
                                    print(controller.contractEdit.toJson());
                                    print(controller.finanicalEdit.toJson());

                                  }
                                  else {

                                    print(controller.contractEdit.toJson());
                                    print(controller.finanicalEdit.toJson());
                                    controller.updateContractAndFinancial();

                                  }
                                }
                              },
                              height: 43.h,
                              width: 140.w,
                              backGroundColor: const Color(ColorCode.green),
                              child: CustomText(
                                  text: CommonLang.update.tr(),
                                  textStyle: TextStyles.textMedium18.copyWith(
                                      fontSize: 16,
                                      color: const Color(ColorCode.white),
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                        CustomText(
                          text: CommonLang.batchPreview.tr(),
                          textAlign: TextAlign.start,
                          textStyle: TextStyles.textMedium18.copyWith(
                            color: const Color(ColorCode.blue),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        controller.contractPaymentsBondModel?.data == null ||controller.contractPaymentsBondModel!.data!.isEmpty
                            ? Center(
                              child: CustomText(
                          text: CommonLang.noBatchesFound.tr(),
                          textAlign: TextAlign.start,
                          textStyle: TextStyles.textMedium18.copyWith(
                              color: const Color(ColorCode.blue),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                          ),
                        ),
                            )
                            : Form(
                                key: formKeyEdit,
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
                                    dateColumn(""),
                                  ],
                                  rows: controller.editBondList
                                      .map((e) => dataRow(e, context))
                                      .toList(),
                                )),
                        SizedBox(
                          height: 30.h,
                        ),

                        BondsDetails(),
                        SizedBox(
                          height: 30.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: CustomText(
                              text: "${CommonLang.addNewDocument.tr()}",
                              textStyle: TextStyles.textMedium18.copyWith(
                                  fontSize: 14,
                                  color: const Color(ColorCode.blue),
                                  fontWeight: FontWeight.w500)),
                        ),
                        Form(
                            key: formKey,
                            child: Align(
                              alignment: Alignment.centerRight,
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
                                  dateColumn(CommonLang.name.tr()),

                                  // dateColumn(CommonLang.numberBatches.tr()),
                                  dateColumn(CommonLang.batchValue.tr()),
                                  dateColumn(CommonLang.tax.tr()),
                                  // dateColumn(CommonLang.totalFees.tr()),
                                  // dateColumn(CommonLang.total.tr()),
                                  dateColumn(CommonLang.duaDate.tr()),
                                  // dateColumn(CommonLang.isBond.tr()),

                                  dateColumn(CommonLang.paymentMade.tr()),
                                ],
                                rows: [1]
                                    .map((e) => dataRow2(e, context))
                                    .toList(),
                              ),
                            )),
                        SizedBox(
                          height: 30.h,
                        ),

                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: CustomText(
                        //       text: "${CommonLang.addNewDocument.tr()}",
                        //       textStyle: TextStyles.textMedium18.copyWith(
                        //           fontSize: 14,
                        //           color: const Color(ColorCode.blue),
                        //           fontWeight: FontWeight.w500)),
                        // ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if ((formKey.currentState?.validate() ??
                                    false)) {
                                  formKey.currentState?.save();
                                  if (controller
                                      .paymentDeadline.text.isNotEmpty) {
                                    controller.createPaymentContract();
                                  } else {
                                    Get.snackbar(
                                        "حطأ", CommonLang.notEmpty.tr());
                                  }
                                }
                              },
                              backGroundColor: const Color(ColorCode.green),
                              width: 100.w,
                              height: 44.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AppAssets.add()),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  CustomText(
                                      text: CommonLang.addNewDocument.tr(),
                                      textStyle: TextStyles.textMedium18
                                          .copyWith(
                                              fontSize: 16,
                                              overflow: TextOverflow.fade,
                                              color:
                                                  const Color(ColorCode.white),
                                              fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                            CustomButton(
                              onPressed: () {
                                controller
                                    .deleteContract(controller.contractId ?? 0);
                              },
                              height: 43.h,
                              width: 140.w,
                              backGroundColor: const Color(ColorCode.red2),
                              child: CustomText(
                                  text: CommonLang.deleteContract.tr(),
                                  textStyle: TextStyles.textMedium18.copyWith(
                                      fontSize: 16,
                                      color: const Color(ColorCode.white),
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
            onLoading: const SpinKitCircle(
              color: Color(ColorCode.blue),
            )));
  }

  DataRow dataRow(EditBondController contractPayment, context) {
    return DataRow(
      color: const MaterialStatePropertyAll(Colors.white),
      cells: <DataCell>[
        DataCell(Container(
          constraints: const BoxConstraints(maxWidth: 300, minWidth: 200),
          child: CustomTextFieldContainer(CustomTextFormField(
            hint: "",
            controller: contractPayment.nameEditingController,
            onSave: (String? val) {
              contractPayment.nameEditingController?.text = val!;
            },
            enabled: contractPayment.isEdit.value,
            inputType: TextInputType.name,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return CommonLang.notEmpty.tr();
              }
              return null;
            },
          )),
        )),
        DataCell(Container(
          width: 200,
          constraints: const BoxConstraints(maxWidth: 300, minWidth: 100),
          child: CustomTextFieldContainer(CustomTextFormField(
            hint: '',
            onSave: (String? val) {},
            controller: contractPayment.paymentDeadlineEditingController,
            readOnly: true,
            enabled: contractPayment.isEdit.value,
            onTap: () async {
              DateTime? dateTime = await controller.pickDate(context);
              print(dateTime);
              if (dateTime != null) {
                DateFormat formatter = DateFormat('yyyy-MM-dd');
                String formattedDate = formatter.format(dateTime);
                contractPayment.paymentDeadlineEditingController?.text =
                    formattedDate;
              }
            },
            inputType: TextInputType.datetime,
            suffixIcon: Image.asset(AppAssets.calendar()),
          )),
        )),
        DataCell(Container(
          constraints: const BoxConstraints(maxWidth: 300, minWidth: 200),
          child: CustomTextFieldContainer(CustomTextFormField(
            hint: "",
            controller: contractPayment.priceEditingController,
            onSave: (String? val) {
              contractPayment.priceEditingController?.text = val!;
            },
            onChange: (String? val) {
              if (val != null && val != "") {
                print("jsdklajsd");

                contractPayment.taxAmountEditingController?.text =
                    (int.tryParse(val)! * .15).toString();
                contractPayment.totalPriceEditingController?.text =
                    (int.tryParse(val)! * .15 + int.tryParse(val)!).toString();
              }
            },
            enabled: contractPayment.isEdit.value,
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
          constraints: const BoxConstraints(maxWidth: 300, minWidth: 200),
          child: CustomTextFieldContainer(CustomTextFormField(
            hint: "",
            controller: contractPayment.taxAmountEditingController,
            onSave: (String? val) {
              contractPayment.taxAmountEditingController?.text = val!;
            },
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
          constraints: const BoxConstraints(maxWidth: 300, minWidth: 200),
          child: CustomTextFieldContainer(CustomTextFormField(
            hint: "",
            readOnly: true,
            controller: contractPayment.totalPriceEditingController,
            onSave: (String? val) {
              contractPayment.totalPriceEditingController?.text = val!;
            },
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
        contractPayment.isEdit.value
            ? DataCell(InkWell(
                onTap: () {
                  // controller.isPaid.value = !controller.isPaid.value;
                  contractPayment.isPaid!.value =
                      !contractPayment.isPaid!.value;
                },
                child: Obx(() => Icon(
                      contractPayment.isPaid!.value
                          ? Icons.radio_button_on
                          : Icons.radio_button_off,
                      color: contractPayment.isPaid!.value
                          ? const Color(ColorCode.green)
                          : const Color(ColorCode.gray2),
                    ))))
            : dataCell(contractPayment.isPaid?.value ?? false
                ? CommonLang.paid.tr()
                : CommonLang.notPaid.tr()),
        DataCell(Obx(
          () => contractPayment.isEdit.value
              ? CustomButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if ((formKeyEdit.currentState?.validate() ?? false)) {
                      formKeyEdit.currentState?.save();
                      if (contractPayment
                          .paymentDeadlineEditingController!.text.isNotEmpty) {
                        controller.requestToUpdate = ContractPayment(
                            name: contractPayment.nameEditingController?.text ??
                                "",
                            paymentDeadline: contractPayment
                                    .paymentDeadlineEditingController?.text ??
                                "",
                            price: double.tryParse(
                                contractPayment.priceEditingController?.text ??
                                    ""),
                            taxAmount: double.tryParse(contractPayment
                                    .taxAmountEditingController?.text ??
                                ""),
                            totalPrice: double.tryParse(
                                contractPayment.totalPriceEditingController?.text ?? ""),
                            isPaid: contractPayment.isPaid?.value ?? false);
                        // controller.requestToUpdate?.name =
                        // controller.requestToUpdate?.price = ;
                        // controller.requestToUpdate?.taxAmount = ;
                        // controller.requestToUpdate?.totalPrice= ;
                        // controller.requestToUpdate?.paymentDeadline = ;
                        // controller.requestToUpdate?.isPaid = ;

                        controller.updatePaymentContract(contractPayment.id!,true);
                        print("sdjkhfdsf");
                      } else {
                        Get.snackbar("حطأ", CommonLang.notEmpty.tr());
                      }
                    }
                  },
                  backGroundColor: const Color(ColorCode.green),
                  width: 100.w,
                  height: 44.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          text: CommonLang.save.tr(),
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontSize: 16,
                              overflow: TextOverflow.fade,
                              color: const Color(ColorCode.white),
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                )
              : Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.deleteRealState(contractPayment.id ?? 0);
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Color(ColorCode.red),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    IconButton(
                      onPressed: () async {
                        print(
                            "contractPayment.nameEditingController.text ${contractPayment.nameEditingController?.text}");
                        for (EditBondController editBond
                            in controller.editBondList) {
                          print(
                              "${editBond.nameEditingController?.text} : ${editBond.isEdit.value}");
                          if (editBond.isEdit.value) {
                            ContractPayment? temp = controller
                                    .contractPaymentsBondModel?.data
                                    ?.firstWhere((element) =>
                                        element.id == editBond.id) ??
                                ContractPayment();

                            print(
                                "contractPayment.nameEditingController.text INSIDE  ${editBond.nameEditingController?.text} ${editBond.isEdit.value}");

                            editBond.nameEditingController?.text =
                                temp.name ?? "";

                            editBond.paymentDeadlineEditingController?.text =
                                temp.paymentDeadline ?? "";

                            editBond.totalPriceEditingController?.text =
                                temp.totalPrice.toString() ?? "";

                            editBond.isPaid?.value = temp.isPaid ?? false;

                            editBond.priceEditingController?.text =
                                temp.price.toString() ?? "";
                            editBond.taxAmountEditingController?.text =
                                temp.taxAmount.toString() ?? "";
                            print(
                                "editBond.priceEditingController.text ${editBond.priceEditingController?.text}");
                          }
                        }

                        contractPayment.isEdit.value =
                            !contractPayment.isEdit.value;
                        for (EditBondController editBond
                            in controller.editBondList) {
                          if (contractPayment.id == editBond.id) {
                          } else {
                            editBond.isEdit.value = false;
                            print(
                                "editBond.isEdit.value ${editBond.nameEditingController?.text}");
                          }
                        }
                        controller.update();
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Color(ColorCode.green),
                      ),
                    ),
                  ],
                ),
        )),
      ],
    );
  }

  DataRow dataRow2(int index, context) {
    return DataRow(
      color: const MaterialStatePropertyAll(Colors.white),
      cells: <DataCell>[
        DataCell(Container(
          constraints: const BoxConstraints(maxWidth: 300, minWidth: 200),
          child: CustomTextFieldContainer(CustomTextFormField(
            hint: "",
            onSave: (String? val) {
              controller.contractPaymentRequest.name = val!;
            },
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
          constraints: const BoxConstraints(maxWidth: 300, minWidth: 200),
          child: CustomTextFieldContainer(CustomTextFormField(
            hint: "",
            onSave: (String? val) {
              controller.contractPaymentRequest.price = double.tryParse(val!);
            },
            onChange: (String? val) {
              controller.contractPaymentRequest.taxAmount =
                  (controller.tax! * double.tryParse(val!)!) / 100;

              controller.taxEditingController.text =
                  ((controller.tax! * double.tryParse(val!)!) / 100).toString();
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return CommonLang.notEmpty.tr();
              }
              return null;
            },
            inputType: TextInputType.numberWithOptions(signed: true, decimal: false),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^-?\d*')),
            ],
          )),
        )),
        DataCell(Container(
          constraints: const BoxConstraints(maxWidth: 300, minWidth: 200),
          child: CustomTextFieldContainer(CustomTextFormField(
            hint: "",
            controller: controller.taxEditingController,
            onSave: (String? val) {},
            readOnly: true,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return CommonLang.notEmpty.tr();
              }
              return null;
            },
            inputType: TextInputType.numberWithOptions(signed: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^-?\d+')),
            ],
          )),
        )),
        // dataInputCell((String? val) {}),
        // dataInputCell((String? val) {}),
        DataCell(Container(
          width: 200,
          constraints: const BoxConstraints(maxWidth: 300, minWidth: 100),
          child: CustomTextFieldContainer(CustomTextFormField(
            hint: '',
            onSave: (String? val) {},
            controller: controller.paymentDeadline,
            readOnly: true,
            onTap: () async {
              DateTime? dateTime = await controller.pickDate(context);
              print(dateTime);
              if (dateTime != null) {
                DateFormat formatter = DateFormat('yyyy-MM-dd');
                String formattedDate = formatter.format(dateTime);
                controller.paymentDeadline.text = formattedDate;
                controller.contractPaymentRequest.paymentDeadline =
                    formattedDate;
              }
            },
            inputType: TextInputType.datetime,
            suffixIcon: Image.asset(AppAssets.calendar()),
          )),
        )),
        // DataCell(
        //   InkWell(
        //       onTap: () {
        //         controller.isDocument.value = !controller.isDocument.value;
        //       },
        //       child: Obx(() => Icon(
        //         controller.isDocument.value
        //             ? Icons.radio_button_on
        //             : Icons.radio_button_off,
        //         color: controller.isDocument.value
        //             ? const Color(ColorCode.green)
        //             : const Color(ColorCode.gray2),
        //       ))),
        // ),

        DataCell(
          InkWell(
              onTap: () {
                controller.isPaid.value = !controller.isPaid.value;
              },
              child: Obx(() => Icon(
                    controller.isPaid.value
                        ? Icons.radio_button_on
                        : Icons.radio_button_off,
                    color: controller.isPaid.value
                        ? const Color(ColorCode.green)
                        : const Color(ColorCode.gray2),
                  ))),
        )
      ],
    );
  }
}
