import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/pages/admin/bond_preview/models/contract_payments_bond_model.dart';
import 'package:property_managment/pages/admin/bond_preview/models/edit_bond_field.dart';
import 'package:property_managment/pages/admin/bond_preview/presentation/controllers/bond_preview_controller.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/widgets/custom_button.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';
import 'package:property_managment/widgets/custom_widgets.dart';

import '../../../../../consts/colors.dart';
import '../../../../../lang/translation_service.dart';
import '../../../../../widgets/custom_text.dart';

class BondsDetails extends GetView<BondPreviewController>{
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return( Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: CommonLang.bondPreview.tr(),
          textAlign: TextAlign.start,
          textStyle: TextStyles.textMedium18.copyWith(
            color: const Color(ColorCode.blue),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4),
        controller.contractsBonds?.data == null || controller.contractsBonds!.data!.isEmpty
            ?     Center(
          child: CustomText(
            text: CommonLang.noBondsFound.tr(),
            textAlign: TextAlign.start,
            textStyle: TextStyles.textMedium18.copyWith(
              color: const Color(ColorCode.blue),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
            : Form(
            key: formKey,
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
                dateColumn(""),
              ],
              rows: controller.editBondsPrivewList
                  .map((e) => dataRow(e, context))
                  .toList(),
            )),
      ],
    ));
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
              if ((formKey.currentState?.validate() ?? false)) {
                formKey.currentState?.save();
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
                  controller.updatePaymentContract(contractPayment.id!,false);
                  print("sdjkhfdsf");
                } else {
                  Get.snackbar("حطأ", CommonLang.notEmpty.tr());
                }
              }
            },
            backGroundColor: const Color(ColorCode.green),
            width: 100,
            height: 44,
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
              IconButton  (
                onPressed: () async {
                  print(
                      "contractPayment.nameEditingController.text ${contractPayment.nameEditingController?.text}");
                  for (EditBondController editBond in controller.editBondsPrivewList) {
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
                  for (EditBondController editBond in controller.editBondsPrivewList) {
                    if (contractPayment.id == editBond.id) {
                    } else {
                      editBond.isEdit.value = false;
                      print("editBond.isEdit.value ${editBond.nameEditingController?.text}");
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

}