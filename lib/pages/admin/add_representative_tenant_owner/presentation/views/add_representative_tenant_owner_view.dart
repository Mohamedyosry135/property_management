import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/add_representative_tenant_owner/presentation/controllers/add_representative_tenant_owner_controller.dart';
import 'package:property_managment/pages/admin/add_tenant_owner/presentation/controllers/add_tenant_owner_controller.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/widgets/custom_button.dart';
import 'package:property_managment/widgets/custom_drop_down_widget.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';
import 'package:property_managment/widgets/custom_widgets.dart';
import 'package:property_managment/widgets/formmatter_date.dart';

class AddRepresentativeTenantOwnerView extends GetView<AddRepresentativeTenantOwnerController> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return controller.obx(
        (state) => Scaffold(
            backgroundColor: const Color(ColorCode.white),
            appBar: AppBar(
              backgroundColor: const Color(ColorCode.gray4),
              automaticallyImplyLeading: false,
              elevation: 0,
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.r),
                  child: InkWell(
                    onTap: () => controller.isRepresentativeOwner? Get.rootDelegate.offNamed(
                        Routes.OWNER_REPRESENTATIVE,
                        arguments: [
                          {"isRepresentativeOwner": true}
                        ]): Get.rootDelegate.offNamed(
                        Routes.TENANT_REPRESENTATIVE,
                        arguments: [
                          {"isRepresentativeOwner": false}
                        ]),
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
                    AppAssets.newOwnerTenant(),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  CustomText(
                    text: controller.isRepresentativeOwner
                        ? CommonLang.addOwnerRepresentative.tr()
                        : CommonLang.addTenantRepresentative.tr(),
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
            body: Padding(
              padding: EdgeInsets.all(12.r),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(ColorCode.gray4),
                        ),
                        child: Center(
                          child: Image.asset(
                            AppAssets.actOnwer() ,
                            color: const Color(ColorCode.blue),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomText(
                          text: controller.isRepresentativeOwner? CommonLang.dataOwnerRepresentative.tr(): CommonLang.dataTenantRepresentative.tr() ,
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black
                          )),

                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text:controller.isRepresentativeOwner? CommonLang.nameOwnerRepresentative.tr():CommonLang.nameTenantRepresentative.tr(),
                                        textStyle: TextStyles.textMedium18.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black.withOpacity(.6)
                                        )),
                                    CustomTextFieldContainer(
                                        CustomTextFormField(
                                          hint: CommonLang.plzWriteFullName.tr(),
                                          onSave: (String? val) {
                                            // controller.email = val!;
                                            controller.createUserRequest.name = val!;

                                          },
                                          validator: (String? value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return CommonLang.notEmpty.tr();
                                            }
                                            return null;
                                          },
                                          inputType: TextInputType.text,

                                        )
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: CommonLang.idNumber.tr(),
                                        textStyle: TextStyles.textMedium18.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black.withOpacity(.6)
                                        )),
                                    CustomTextFieldContainer(
                                        CustomTextFormField(
                                          hint: '',
                                          onSave: (String? val) {
                                            // controller.email = val!;
                                            controller.createUserRequest.verificationId = val!;

                                          },
                                          validator: (String? value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return CommonLang.notEmpty.tr();
                                            }
                                            return null;
                                          },
                                          inputType: TextInputType.number,

                                        )
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: CommonLang.dateOfBirth.tr(),
                                        textStyle: TextStyles.textMedium18.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black.withOpacity(.6)
                                        )),
                                    CustomTextFieldContainer(
                                        CustomTextFormField(
                                          hint: '',
                                          onSave: (String? val) {},
                                          controller: controller.birthDate,
                                          readOnly: true,
                                          onTap: () async {
                                            DateTime? dateTime =
                                            await controller.pickDate(context);
                                            print(dateTime);
                                            if (dateTime != null) {
                                              DateFormat formatter =
                                              DateFormat('yyyy-MM-dd');
                                              String formattedDate =
                                              formatter.format(dateTime);
                                              controller.birthDate.text = formattedDate;

                                              controller.createUserRequest.birthdate =
                                                  formattedDate;
                                            }
                                          },
                                          inputType: TextInputType.datetime,
                                          suffixIcon:
                                          Image.asset(AppAssets.calendar()),
                                        ))

                                    // CustomTextFieldContainer(
                                    //     CustomTextFormField(
                                    //       hint: '00 / 00 / 0000',
                                    //       onSave: (String? val) {
                                    //         // controller.email = val!;
                                    //         controller.createUserRequest.birthdate = val!;
                                    //
                                    //       },
                                    //       inputFormatters: [
                                    //         FilteringTextInputFormatter.deny(RegExp(r'[^\d-]')), // Only allow digits and hyphen
                                    //         LengthLimitingTextInputFormatter(10), // Limit input length to 10 characters
                                    //         DateInputFormatter(), // Custom input formatter
                                    //       ],
                                    //       validator: (String? value) {
                                    //         if (value == null ||
                                    //             value.isEmpty) {
                                    //           return CommonLang.notEmpty.tr();
                                    //         }
                                    //         return null;
                                    //       },
                                    //       inputType: TextInputType.datetime,
                                    //       suffixIcon:Image.asset(AppAssets.calendar()) ,
                                    //     )
                                    // )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: CommonLang.mobileNumber.tr(),
                                        textStyle: TextStyles.textMedium18.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black.withOpacity(.6)
                                        )),
                                    CustomTextFieldContainer(
                                        CustomTextFormField(
                                          hint:  CommonLang.mobileNumber.tr(),
                                          onSave: (String? val) {
                                            // controller.email = val!;
                                            controller.createUserRequest.phone = val!;

                                          },
                                          validator: (String? value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return CommonLang.notEmpty.tr();
                                            }
                                            return null;
                                          },
                                          inputType: TextInputType.phone,

                                        )
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 30.h,
                          ),


                          Row(
                            children: [


                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: CommonLang.email.tr(),
                                        textStyle: TextStyles.textMedium18.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black.withOpacity(.6)
                                        )),
                                    CustomTextFieldContainer(
                                        CustomTextFormField(
                                          hint:  CommonLang.plzWriteUrMail.tr(),
                                          onSave: (String? val) {
                                            // controller.email = val!;
                                            controller.createUserRequest.email = val!;

                                          },
                                          validator: (String? value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return CommonLang.notEmpty.tr();
                                            }
                                            return null;
                                          },
                                          inputType: TextInputType.phone,

                                        )
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12,),
                                 Expanded(
                                child:  Obx(() =>
                                    Padding(
                                      padding: EdgeInsets.only(top: 0),
                                      child: CustomDropDownWidget<String>(
                                          value: controller.translateMap[controller
                                              .selectedRole.value] ??"",
                                          items: controller.userRoles ??
                                              [],
                                          label: CommonLang.userRole.tr(),
                                          onRemove: () {
                                            // controller.selectedRole
                                            //     .value = "";
                                            // controller.update();
                                          },
                                          onChange: (val) {
                                            // if(controller.isEditing){
                                            //   controller.addMaintenanceRequest.realStateId = val?.id ?? -1;
                                            // }
                                            // controller.selectedRole
                                            //     .value = val!;
                                            // controller.update();
                                          }),
                                    )),
                              ),
                              const SizedBox(width: 12,),
                              const Expanded(
                                child: SizedBox(),
                              ), const SizedBox(width: 12,),
                              const Expanded(
                                child: SizedBox(),
                              ),

                            ],
                          ),


                          SizedBox(
                            height: 50  .h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: SizedBox(),
                              ),
                              controller.obx((state) => CustomButton(
                                onPressed: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  if ((formKey.currentState?.validate() ?? false)) {
                                    formKey.currentState?.save();
                                    controller.onCreateUser();
                                  }
                                },
                                height: 43.h,
                                width: 140.w,
                                backGroundColor: const Color(ColorCode.green),
                                child: CustomText(
                                    text: CommonLang.add.tr(),
                                    textStyle: TextStyles.textMedium18.copyWith(
                                        fontSize: 16,
                                        color: const Color(ColorCode.white),
                                        fontWeight: FontWeight.w500
                                    )
                                ),
                              ),onLoading:  const SpinKitCircle(color: Color(ColorCode.blue)))
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            )),
        onLoading: const SpinKitCircle(
          color: Color(ColorCode.blue),
        ));
  }


}
