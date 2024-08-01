import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:property_managment/pages/admin/delete_user/presentation/controllers/delete_user_controller.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/widgets/custom_widgets.dart';

import '../../../../../consts/colors.dart';
import '../../../../../consts/text_styles.dart';
import '../../../../../lang/translation_service.dart';
import '../../../../../resources/common_assets.dart';
import '../../../../../routes/common_routing/app_pages.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../widgets/custom_text_field_container.dart';
import '../../../../../widgets/custom_text_form_field.dart';
import '../../../../../widgets/formmatter_date.dart';

class DeleteUserView extends GetView<DeleteUserController> {
  final GlobalKey<FormState> formKey = GlobalKey();

  DeleteUserView({super.key});

  @override
  Widget build(BuildContext context) {
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
                onTap: () {
                  if(controller.user?.role == "admin"){
                    Get.rootDelegate.offNamed(Routes.ADMINS);
                  }else if(controller.user?.role == "owner"){
                    Get.rootDelegate.offNamed(Routes.OWNER,arguments: [
                      {"isOwner": true}
                    ]);
                  }
                  else if(controller.user?.role == "owner_representer"){
                    Get.rootDelegate.offNamed(Routes.OWNER_REPRESENTATIVE,arguments: [
                      {"isRepresentativeOwner": true}
                    ]);
                  }else if(controller.user?.role == "renter"){
                    Get.rootDelegate.offNamed(Routes.TENANT,arguments: [
                      {"isOwner": false}
                    ]);
                  }else if(controller.user?.role == "renter_representer"){
                    Get.rootDelegate.offNamed(Routes.TENANT_REPRESENTATIVE,arguments: [
                      {"isRepresentativeOwner": false}
                    ]);
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
                text: CommonLang.edit.tr(),
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
                        text: controller.user?.name ?? '',
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: CommonLang.firstName.tr(),
                                    textStyle: TextStyles.textMedium18.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(.6))),
                                CustomTextFieldContainer(CustomTextFormField(
                                  hint: CommonLang.plzWriteFullName.tr(),
                                  controller: controller.nameController,
                                  onSave: (String? val) {
                                    // controller.email = val!;
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return CommonLang.notEmpty.tr();
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: CommonLang.idNumber.tr(),
                                    textStyle: TextStyles.textMedium18.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(.6))),
                                CustomTextFieldContainer(CustomTextFormField(
                                  hint: '',
                                  controller: controller.idController,
                                  onSave: (String? val) {
                                    // controller.email = val!;
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return CommonLang.notEmpty.tr();
                                    }
                                    return null;
                                  },
                                  inputType: TextInputType.number,
                                ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: CommonLang.dateOfBirth.tr(),
                                    textStyle: TextStyles.textMedium18.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(.6))),
                                CustomTextFieldContainer(CustomTextFormField(
                                  hint: '0000-00-00',
                                  controller: controller.birthDateController,
                                  onSave: (String? val) {
                                    // controller.email = val!;
                                  },
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
                                      controller.birthDateController.text = formattedDate;
                                    }
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return CommonLang.notEmpty.tr();
                                    }
                                    return null;
                                  },
                                  inputType: TextInputType.datetime,
                                  suffixIcon: Image.asset(AppAssets.calendar()),
                                ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: CommonLang.mobileNumber.tr(),
                                    textStyle: TextStyles.textMedium18.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(.6))),
                                CustomTextFieldContainer(CustomTextFormField(
                                  hint: CommonLang.mobileNumber.tr(),
                                  controller: controller.phoneController,
                                  onSave: (String? val) {
                                    // controller.email = val!;
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return CommonLang.notEmpty.tr();
                                    }
                                    return null;
                                  },
                                  inputType: TextInputType.phone,
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: CommonLang.signNumber.tr(),
                                    textStyle: TextStyles.textMedium18.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(.6))),
                                CustomTextFieldContainer(CustomTextFormField(
                                  hint: "",
                                  controller: controller.fileController,
                                  onSave: (String? val) {
                                    // controller.email = val!;
                                  },
                                  validator: (String? value) {
                                    if ((value == null || value.isEmpty) && controller.fileExpireDateController.text.isEmpty) {
                                      return CommonLang.fillEither.tr();
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: CommonLang.signEndDate.tr(),
                                    textStyle: TextStyles.textMedium18.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(.6))),
                                CustomTextFieldContainer(CustomTextFormField(
                                  hint: '0000-00-00',
                                  controller:
                                      controller.fileExpireDateController,
                                  onSave: (String? val) {
                                    // controller.email = val!;
                                  },
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
                                      controller.fileExpireDateController.text = formattedDate;
                                    }
                                    // else{
                                    //
                                    //   controller.fileExpireDateController.text = "";
                                    // }
                                  },
                                  validator: (String? value) {
                                    if ((value == null || value.isEmpty) && controller.fileController.text.isEmpty) {
                                      return CommonLang.fillEither  .tr();
                                    }
                                    return null;
                                  },
                                  inputType: TextInputType.datetime,

                                  suffixIcon: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(AppAssets.calendar()),
                                        SizedBox(width: 8,),
                                        InkWell(
                                            onTap: (){
                                              controller.fileExpireDateController.text = "";

                                            },
                                            child: Icon(Icons.close, color: Colors.red,))
                                      ],
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: CommonLang.email.tr(),
                                    textStyle: TextStyles.textMedium18.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(.6))),
                                CustomTextFieldContainer(CustomTextFormField(
                                  hint: CommonLang.plzWriteUrMail.tr(),
                                  controller: controller.emailController,
                                  onSave: (String? val) {
                                    // controller.email = val!;
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return CommonLang.notEmpty.tr();
                                    }
                                    return null;
                                  },
                                  inputType: TextInputType.phone,
                                ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                        ],
                      ),


                      SizedBox(
                        height: 50.h,
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
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  if ((formKey.currentState?.validate() ?? false)) {
                                    formKey.currentState?.save();
                                    controller.onEditUser();
                                  }
                                },
                                height: 43.h,
                                width: 140.w,
                                backGroundColor: const Color(ColorCode.green),
                                child: CustomText(
                                    text: CommonLang.update.tr(),
                                    textStyle: TextStyles.textMedium18
                                        .copyWith(
                                        fontSize: 16,
                                        color: const Color(
                                            ColorCode.white),
                                        fontWeight: FontWeight.w500)),
                              ),
                              onLoading: SizedBox(
                                width: 140.w,
                                child: const SpinKitCircle(
                                  color: Color(ColorCode.blue),
                                  size: 30,
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
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
                                      deleteItem(
                                        context,
                                        CommonLang.deleteUser.tr(),
                                        CommonLang.doYouWantToDelete.tr(),
                                        CommonLang.cancel.tr(),
                                        CommonLang.delete.tr(),
                                          (){
                                            controller.onDeleteUser();
                                          }
                                      );
                                      //
                                    },
                                height: 43.h,
                                width: 140.w,
                                backGroundColor: const Color(ColorCode.red2),
                                child: CustomText(
                                    text: CommonLang.delete.tr(),
                                    textStyle: TextStyles.textMedium18.copyWith(
                                        fontSize: 16,
                                        color: const Color(ColorCode.white),
                                        fontWeight: FontWeight.w500)
                                ),
                                  ),
                              onLoading: SizedBox(
                                width: 140.w,
                                child: const SpinKitCircle(
                                  color: Color(ColorCode.blue),
                                  size: 30,
                                ),
                              ))
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
        ));
  }
}
