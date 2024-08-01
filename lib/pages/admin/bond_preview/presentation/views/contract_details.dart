import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';

import '../../../../../widgets/custom_drop_down_widget.dart';
import '../../../owners_tenants/models/users.dart';
import '../controllers/bond_preview_controller.dart';

class ContractDetails extends GetView<BondPreviewController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() => controller.loadingData.value ? SpinKitCircle(color: Color(ColorCode.primary),) : Column(
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
          height: 8.h,
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
                        controller.contractEdit.contractNumber = val!;
                      },
                      controller: controller.contractNumber,
                      // enabled: false,
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
                      onSave: (String? val) {
                        controller.contractEdit.startDate = val!;

                      },
                      controller: controller.startDate,
                      readOnly: true,
                      // enabled: false,

                      onChange: (String? val) {},
                      onTap: () async {
                        controller.startDateTime = await controller.pickDate(context);
                        print(controller.startDateTime);
                        if (controller.startDateTime != null) {
                          DateFormat formatter = DateFormat('yyyy-MM-dd');
                          String formattedDate = formatter.format(controller.startDateTime ?? DateTime.now());
                          controller.startDate.text = formattedDate;
                          controller.contractEdit.startDate = formattedDate;
                        }
                      },
                      inputType: TextInputType.datetime,
                      suffixIcon: Image.asset(AppAssets.calendar()),
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
                        text: "${CommonLang.contractEndDate.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    CustomTextFieldContainer(CustomTextFormField(
                      hint: '',
                      onSave: (String? val) {
                        controller.contractEdit.endDate = val!;

                      },
                      controller: controller.endDate,
                      readOnly: true,
                      // enabled: false,

                      onTap: () async {
                        DateTime? dateTime = await controller.pickDate(context);
                        print(dateTime);
                        if (dateTime != null) {
                          DateFormat formatter = DateFormat('yyyy-MM-dd');
                          String formattedDate = formatter.format(dateTime);
                          controller.endDate.text = formattedDate;
                          controller.contractEdit.endDate = formattedDate;
                        }
                      },
                      inputType: TextInputType.datetime,
                      suffixIcon: Image.asset(AppAssets.calendar()),
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
                          controller.contractEdit.realStateId = null;

                          controller.update();
                        },
                        onChange: (val) {
                          // if(controller.isEditing){
                          //   controller.addMaintenanceRequest.realStateId = val?.id ?? -1;
                          // }
                          controller.selectedRealStatesModel.value = val!;
                          controller.contractEdit.realStateId = controller.selectedRealStatesModel.value.id;

                          controller.update();
                        }))
                  ],
                ),
              ),

            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              AppAssets.people(),
              color: const Color(ColorCode.blue),
            ),
            const SizedBox(
              width: 8,
            ),
            CustomText(
              text: CommonLang.contractParties.tr(),
              textAlign: TextAlign.start,
              textStyle: TextStyles.textMedium18.copyWith(
                color: const Color(ColorCode.blue),
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
                        text: "${CommonLang.renter.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(() => CustomDropDownWidget<Users>(
                        value: controller.selectedOwner.value,
                        items: controller.usersOwner ?? [],
                        // label: CommonLang.realEstate.tr(),
                        onRemove: () {
                          controller.selectedOwner.value = Users();
                          controller.contractEdit.ownerId = null;

                        },

                        onChange: (val) {

                          controller.selectedOwner.value = val!;
                          controller.contractEdit.ownerId = controller.selectedOwner.value.id;

                        }))
                  ],
                ),
              ),

              SizedBox(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: "${CommonLang.representativeRenter.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(() => CustomDropDownWidget<Users>(
                        value: controller.selectedRepresentativeOwner.value,
                        items: controller.usersOwnerRepresenter ?? [],
                        onRemove: () {
                          controller.selectedRepresentativeOwner.value = Users();
                          controller.contractEdit.ownerRepresenterId = null;

                        },
                        onChange: (val) {

                          controller.selectedRepresentativeOwner.value = val!;
                          controller.contractEdit.ownerRepresenterId = controller.selectedRepresentativeOwner.value.id;

                        }))
                  ],
                ),
              ),
              SizedBox(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: "${CommonLang.tenant.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(() => CustomDropDownWidget<Users>(
                        value: controller.selectedLessor.value,
                        items: controller.usersRenter ?? [],
                        onRemove: () {
                          controller.selectedLessor.value = Users();
                          controller.contractEdit.renterId = null;

                        },
                        onChange: (val) {
                          controller.selectedLessor.value = val!;
                          controller.contractEdit.renterId = controller.selectedLessor.value.id;

                        }))
                  ],
                ),
              ),
              SizedBox(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: "${CommonLang.tenantRepresentative.tr()}",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(.6))),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(() => CustomDropDownWidget<Users>(
                        value: controller.selectedRepresentativeLessor.value,
                        items: controller.usersRenterRepresenter ?? [],
                        // label: CommonLang.realEstate.tr(),
                        onRemove: () {
                          controller.selectedRepresentativeLessor.value = Users();
                          controller.contractEdit.renterRepresenterId = null;
                        },

                        onChange: (val) {

                          controller.selectedRepresentativeLessor.value = val!;
                          controller.contractEdit.renterRepresenterId = controller.selectedRepresentativeLessor.value.id;

                        }))
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
    ));
  }
}
