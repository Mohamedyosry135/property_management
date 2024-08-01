import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/add_tenant_owner/presentation/controllers/add_tenant_owner_controller.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/widgets/custom_button.dart';
import 'package:property_managment/widgets/custom_drop_down_widget.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';
import 'package:property_managment/widgets/formmatter_date.dart';

class AddTenantOwnerView extends GetView<AddTenantOwnerController> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return controller.obx(
            (state) =>
            Scaffold(
                backgroundColor: const Color(ColorCode.white),
                appBar: AppBar(
                  backgroundColor: const Color(ColorCode.gray4),
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  actions: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.r),
                      child: InkWell(
                        onTap: () {
                          if (controller.isOwner == "owner") {
                            Get.rootDelegate
                                .offNamed(Routes.OWNER, arguments: [
                              {"isOwner": true}
                            ]);
                          } else if (controller.isOwner == "renter") {
                            Get.rootDelegate
                                .offNamed(Routes.TENANT, arguments: [
                              {"isOwner": false}
                            ]);
                          } else {
                            Get.rootDelegate
                                .offNamed(Routes.ADMINS,);
                          }
                        },
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
                        text: controller.isOwner == "owner"
                            ? CommonLang.addNewOwner.tr() :controller.isOwner == "renter" ?
                           CommonLang.addNewTenant.tr() : CommonLang.addNewAdmin.tr(),
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
                  child: Form(
                    key: formKey,
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
                                  AppAssets.actOnwer(),
                                  color: const Color(ColorCode.blue),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            CustomText(
                           text:
                                controller.isOwner == "owner"
                                    ? CommonLang.ownerData.tr() :controller.isOwner == "renter" ?
                                CommonLang.tenantData.tr() : CommonLang.addNewAdmin.tr(),
                                textStyle: TextStyles.textMedium18.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            CustomText(
                                                text:

                                                controller.isOwner == "owner"
                                                    ? CommonLang.lessorOwner.tr() :controller.isOwner == "renter" ?
                                                CommonLang.tenant.tr() : CommonLang.admin.tr(),
                                                textStyle: TextStyles
                                                    .textMedium18
                                                    .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.black
                                                        .withOpacity(.6))),
                                            CustomTextFieldContainer(
                                                CustomTextFormField(
                                                  hint: CommonLang
                                                      .plzWriteFullName.tr(),
                                                  onSave: (String? val) {
                                                    controller.createUserRequest
                                                        .name = val!;
                                                  },
                                                  validator: (String? value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return CommonLang.notEmpty
                                                          .tr();
                                                    }
                                                    return null;
                                                  },
                                                  inputType: TextInputType.text,
                                                ))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                   if(controller.isOwner!="admin")   Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            CustomText(
                                                text: CommonLang.idNumber.tr(),
                                                textStyle: TextStyles
                                                    .textMedium18
                                                    .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.black
                                                        .withOpacity(.6))),
                                            CustomTextFieldContainer(
                                                CustomTextFormField(
                                                  hint: '',
                                                  onSave: (String? val) {
                                                    controller.createUserRequest
                                                        .verificationId = val!;
                                                  },
                                                  // validator: (String? value) {
                                                  //   if (value == null ||
                                                  //       value.isEmpty) {
                                                  //     return CommonLang.notEmpty.tr();
                                                  //   }
                                                  //   return null;
                                                  // },
                                                  inputType: TextInputType
                                                      .number,
                                                ))
                                          ],
                                        ),
                                      ),
                                      if(controller.isOwner!="admin")   const SizedBox(
                                        width: 12,
                                      ),
                                      if(controller.isOwner!="admin")    Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            CustomText(
                                                text: CommonLang.dateOfBirth
                                                    .tr(),
                                                textStyle: TextStyles
                                                    .textMedium18
                                                    .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.black
                                                        .withOpacity(.6))),

                                            CustomTextFieldContainer(
                                                CustomTextFormField(
                                                  hint: '',
                                                  onSave: (String? val) {},
                                                  controller: controller
                                                      .birthDate,
                                                  readOnly: true,
                                                  onTap: () async {
                                                    DateTime? dateTime =
                                                    await controller.pickDate(
                                                        context);
                                                    print(dateTime);
                                                    if (dateTime != null) {
                                                      DateFormat formatter =
                                                      DateFormat('yyyy-MM-dd');
                                                      String formattedDate =
                                                      formatter.format(
                                                          dateTime);
                                                      controller.birthDate
                                                          .text = formattedDate;

                                                      controller
                                                          .createUserRequest
                                                          .birthdate =
                                                          formattedDate;
                                                    }
                                                  },
                                                  inputType: TextInputType
                                                      .datetime,
                                                  suffixIcon:
                                                  Image.asset(
                                                      AppAssets.calendar()),
                                                ))
                                            // CustomTextFieldContainer(
                                            //     CustomTextFormField(
                                            //       hint: '0000-00-00',
                                            //   onSave: (String? val) {
                                            //     controller.createUserRequest.birthdate = val!;
                                            //
                                            //   },
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
                                            //   inputType: TextInputType.datetime,
                                            //   suffixIcon:
                                            //       Image.asset(AppAssets.calendar()),
                                            // ))
                                          ],
                                        ),
                                      ),
                                      if(controller.isOwner!="admin")  const SizedBox(
                                        width: 12,
                                      ),
                                      if(controller.isOwner!="admin")       Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            CustomText(
                                                text: CommonLang.mobileNumber
                                                    .tr(),
                                                textStyle: TextStyles
                                                    .textMedium18
                                                    .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.black
                                                        .withOpacity(.6))),
                                            CustomTextFieldContainer(
                                                CustomTextFormField(
                                                  hint: CommonLang.mobileNumber
                                                      .tr(),
                                                  onSave: (String? val) {
                                                    controller.createUserRequest
                                                        .phone = val!;
                                                  },
                                                  validator: (String? value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return CommonLang.notEmpty
                                                          .tr();
                                                    }
                                                    return null;
                                                  },
                                                  inputType: TextInputType
                                                      .phone,
                                                ))
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
                                      if(controller.isOwner!="admin")   Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            CustomText(
                                                text: CommonLang.signNumber
                                                    .tr(),
                                                textStyle: TextStyles
                                                    .textMedium18
                                                    .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.black
                                                        .withOpacity(.6))),
                                            CustomTextFieldContainer(
                                                CustomTextFormField(
                                                  hint: "",
                                                  onSave: (String? val) {
                                                    controller.createUserRequest
                                                        .realstateNumber = val!;
                                                  },
                                                  // validator: (String? value) {
                                                  //   if (value == null ||
                                                  //       value.isEmpty) {
                                                  //     return CommonLang.notEmpty.tr();
                                                  //   }
                                                  //   return null;
                                                  // },
                                                  inputType: TextInputType.text,
                                                ))
                                          ],
                                        ),
                                      ),
                                      if(controller.isOwner!="admin")  const SizedBox(
                                        width: 12,
                                      ),
                                      if(controller.isOwner!="admin")  Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            CustomText(
                                                text: CommonLang.signEndDate
                                                    .tr(),
                                                textStyle: TextStyles
                                                    .textMedium18
                                                    .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.black
                                                        .withOpacity(.6))),

                                            CustomTextFieldContainer(
                                                CustomTextFormField(
                                                  hint: '',
                                                  onSave: (String? val) {},
                                                  controller: controller
                                                      .registerationEndDate,
                                                  readOnly: true,
                                                  onTap: () async {
                                                    DateTime? dateTime =
                                                    await controller.pickDate(
                                                        context);
                                                    print(dateTime);
                                                    if (dateTime != null) {
                                                      DateFormat formatter =
                                                      DateFormat('yyyy-MM-dd');
                                                      String formattedDate =
                                                      formatter.format(
                                                          dateTime);
                                                      controller
                                                          .registerationEndDate
                                                          .text = formattedDate;
                                                      controller
                                                          .createUserRequest
                                                          .realstateEndsDate =
                                                          formattedDate;
                                                    }
                                                  },
                                                  inputType: TextInputType
                                                      .datetime,
                                                  suffixIcon: Padding(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize
                                                          .min,
                                                      children: [
                                                        Image.asset(AppAssets
                                                            .calendar()),
                                                        SizedBox(width: 8,),
                                                        InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .registerationEndDate
                                                                  .text = "";
                                                              controller
                                                                  .createUserRequest
                                                                  .realstateEndsDate ==
                                                                  "";
                                                            },
                                                            child: Icon(
                                                              Icons.close,
                                                              color: Colors
                                                                  .red,))
                                                      ],
                                                    ),
                                                  ),

                                                ))

                                          ],
                                        ),
                                      ),
                                      if(controller.isOwner!="admin")  const SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            CustomText(
                                                text: CommonLang.email.tr(),
                                                textStyle: TextStyles
                                                    .textMedium18
                                                    .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.black
                                                        .withOpacity(.6))),
                                            CustomTextFieldContainer(
                                                CustomTextFormField(
                                                  hint: CommonLang
                                                      .plzWriteUrMail.tr(),
                                                  onSave: (String? val) {
                                                    controller.createUserRequest
                                                        .email = val!;
                                                  },
                                                  validator: (String? value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return CommonLang.notEmpty
                                                          .tr();
                                                    }
                                                    return null;
                                                  },
                                                  inputType: TextInputType
                                                      .phone,
                                                ))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            CustomText(
                                                text: CommonLang.password.tr(),
                                                textStyle: TextStyles
                                                    .textMedium18
                                                    .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.black
                                                        .withOpacity(.6))),
                                            CustomTextFieldContainer(
                                                CustomTextFormField(
                                                    hint: CommonLang
                                                        .plzWritePassword
                                                        .tr(),
                                                    onSave: (String? val) {
                                                      controller
                                                          .createUserRequest
                                                          .password = val!;
                                                    },
                                                    inputType:
                                                    TextInputType
                                                        .visiblePassword,
                                                    obscureText: true,
                                                    obscuringCharacter: "*",
                                                    isHiddenPassword: true,
                                                    validator: (String? value) {
                                                      return controller.isValidPassword(value!) ? null: CommonLang.passwordMoreThanEight.tr();

                                                    }))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Expanded(
                                        child: Obx(() =>
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: CustomDropDownWidget<
                                                  String>(
                                                  value: controller.translateMap[controller.selectedRole.value ??""] ??"",
                                                  items: controller.userRoles ??
                                                      [],
                                                  label: CommonLang.userRole
                                                      .tr(),
                                                  // onRemove: () {
                                                  //   // controller.selectedRole
                                                  //   //     .value = "";
                                                  //   // controller.update();
                                                  // },

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
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),

                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                      controller.obx(
                                              (state) =>
                                              CustomButton(
                                                onPressed: () {
                                                  FocusManager.instance
                                                      .primaryFocus?.unfocus();
                                                  if ((formKey.currentState
                                                      ?.validate() ?? false)) {
                                                    formKey.currentState
                                                        ?.save();
                                                    if(controller.isOwner!="admin") {
                                                      if ((controller
                                                          .createUserRequest
                                                          .realstateNumber !=
                                                          null &&
                                                          controller.birthDate
                                                              .text.isNotEmpty) ||
                                                          (controller
                                                              .createUserRequest
                                                              .verificationId !=
                                                              null && controller
                                                              .registerationEndDate
                                                              .text.isNotEmpty)) {
                                                        // Get.snackbar("success", "success");

                                                        controller.onCreateUser();
                                                      } else {
                                                        Get.snackbar(
                                                            CommonLang.error.tr(),
                                                            CommonLang.errorChoose
                                                                .tr());
                                                      }
                                                    }else{
                                                      controller.onCreateUser();

                                                    }

                                                  }
                                                },
                                                height: 43.h,
                                                width: 140.w,
                                                backGroundColor:
                                                const Color(ColorCode.green),
                                                child: CustomText(
                                                    text: CommonLang.add.tr(),
                                                    textStyle: TextStyles
                                                        .textMedium18
                                                        .copyWith(
                                                        fontSize: 16,
                                                        color:
                                                        const Color(
                                                            ColorCode.white),
                                                        fontWeight:
                                                        FontWeight.w500)),
                                              ),
                                          onLoading: const SpinKitCircle(
                                              color: Color(ColorCode.blue)))
                                    ],
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                )),
        onLoading: const SpinKitCircle(
          color: Color(ColorCode.blue),
        ));
  }


}

