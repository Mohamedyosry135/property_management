import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/create_contract/presentation/controllers/create_contract_controller.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/widgets/custom_drop_down_widget.dart';
import 'package:property_managment/widgets/custom_text.dart';

class ContractParties extends GetView<CreateContractController> {
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
                        },
                        onChange: (val) {

                          controller.selectedOwner.value = val!;
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
                        },
                        onChange: (val) {

                          controller.selectedRepresentativeOwner.value = val!;
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
                        },
                        onChange: (val) {

                          controller.selectedLessor.value = val!;
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
                        },
                        onChange: (val) {

                          controller.selectedRepresentativeLessor.value = val!;
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
    );
  }
}
