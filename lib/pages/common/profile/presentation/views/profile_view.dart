import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/common/profile/presentation/controllers/profile_controller.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/services/auth_service.dart';
import 'package:property_managment/widgets/custom_build_widget.dart';
import 'package:property_managment/widgets/custom_button.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';

class ProfileView extends GetView<ProfileController> {
   ProfileView({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // print(AuthService.to.userInfo?.result?.data?.role == "admin")
    return CustomBuildWidget(
        index:
            AuthService.to.userInfo!.result!.data?.role == "admin"? 8 : 2,
        viewPage: controller.obx(
            (snap) => Scaffold(
                backgroundColor: const Color(ColorCode.gray4),
                body: Padding(
                  padding: EdgeInsets.all(12.r),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              AppAssets.profileIcon(),
                              color: const Color(ColorCode.blue),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            CustomText(
                              text: CommonLang.profile.tr(),
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
                          height: 12.h,
                        ),
                        Form(
                          key: formKey,
                          child: Container(
                            padding: EdgeInsets.all(50.r),
                            decoration: BoxDecoration(
                                color: const Color(ColorCode.white),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              text: CommonLang.name.tr(),
                                              textStyle: TextStyles.textMedium18
                                                  .copyWith(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 12,
                                                      color: Colors.black
                                                          .withOpacity(.6))),
                                          CustomTextFieldContainer(
                                              CustomTextFormField(
                                            hint: controller.firstName,
                                            controller:
                                                controller.firstNameController,
                                            onSave: (String? val) {
                                              controller.firstName = val!;
                                            },
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return CommonLang.notEmpty.tr();
                                                  }
                                                  return null;
                                                },
                                            inputType: TextInputType.text,
                                          ))
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          width: 20.w,
                                        )),
                                    Expanded(
                                      flex: 2,
                                      child: SizedBox(),
                                      // child: Column(
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.start,
                                      //   children: [
                                      //     CustomText(
                                      //         text: CommonLang.familyName.tr(),
                                      //         textStyle: TextStyles.textMedium18
                                      //             .copyWith(
                                      //                 fontWeight: FontWeight.w500,
                                      //                 fontSize: 12,
                                      //                 color: Colors.black
                                      //                     .withOpacity(.6))),
                                      //     CustomTextFieldContainer(
                                      //         CustomTextFormField(
                                      //       hint: controller.familyName,
                                      //       controller:
                                      //           controller.familyNameController,
                                      //       onSave: (String? val) {
                                      //         controller.familyName = val!;
                                      //       },
                                      //           validator: (String? value) {
                                      //             if (value == null ||
                                      //                 value.isEmpty) {
                                      //               return CommonLang.notEmpty.tr();
                                      //             }
                                      //             return null;
                                      //           },
                                      //       inputType: TextInputType.text,
                                      //     ))
                                      //   ],
                                      // ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 26.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              text: CommonLang.mobileNumber.tr(),
                                              textStyle: TextStyles.textMedium18
                                                  .copyWith(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 12,
                                                      color: Colors.black
                                                          .withOpacity(.6))),
                                          CustomTextFieldContainer(
                                              CustomTextFormField(
                                            hint: controller.phone,
                                            controller:
                                                controller.phoneController,
                                            onSave: (String? val) {
                                              controller.phone = val!;
                                            },
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return CommonLang.notEmpty.tr();
                                                  }
                                                  return null;
                                                },
                                            inputType: TextInputType.phone,
                                          ))
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          width: 20.w,
                                        )),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              text: CommonLang.email.tr(),
                                              textStyle: TextStyles.textMedium18
                                                  .copyWith(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 12,
                                                      color: Colors.black
                                                          .withOpacity(.6))),
                                          CustomTextFieldContainer(
                                              CustomTextFormField(
                                            hint: controller.email,
                                            controller:
                                                controller.emailController,
                                            onSave: (String? val) {
                                              controller.email = val!;
                                            },
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return CommonLang.notEmpty.tr();
                                                  }
                                                  return null;
                                                },
                                            inputType: TextInputType.emailAddress,
                                          ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 50.h,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(ColorCode.gray4),
                                      ),
                                      child: Image.asset(
                                        AppAssets.key(),
                                        color: const Color(ColorCode.blue),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    CustomText(
                                        text: CommonLang.changePassword.tr(),
                                        textStyle: TextStyles.textMedium18
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: Colors.black
                                                    .withOpacity(.6))),
                                  ],
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     CustomText(
                                //         text:
                                //             "${CommonLang.currentPassword.tr()}*",
                                //         textStyle: TextStyles.textMedium18
                                //             .copyWith(
                                //                 fontWeight: FontWeight.w500,
                                //                 fontSize: 12,
                                //                 color: Colors.black
                                //                     .withOpacity(.6))),
                                //     ObxValue<RxBool>(
                                //         (state) => CustomTextFieldContainer(
                                //                 CustomTextFormField(
                                //               hint: '',
                                //               onSave: (String? val) {
                                //                 controller.currentPassword = val!;
                                //               },
                                //               inputType:
                                //                   TextInputType.visiblePassword,
                                //               obscureText: true,
                                //               obscuringCharacter: "•",
                                //               isHiddenPassword: state.value,
                                //               onTapShowHidePassword: () => controller
                                //                   .changeIsHiddenCurrentPassword(),
                                //             )),
                                //         controller.isHiddenCurrentPassword)
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 50.h,
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              text: CommonLang.newPassword.tr(),
                                              textStyle: TextStyles.textMedium18
                                                  .copyWith(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 12,
                                                      color: Colors.black
                                                          .withOpacity(.6))),
                                          ObxValue<RxBool>(
                                              (state) => CustomTextFieldContainer(
                                                      CustomTextFormField(
                                                    hint: '',
                                                    controller: controller.newPassword,
                                                    onSave: (String? val) {},
                                                    inputType: TextInputType.visiblePassword,
                                                    obscureText: true,
                                                    obscuringCharacter: "•",
                                                    isHiddenPassword: state.value,
                                                    onTapShowHidePassword: () => controller.changeIsHiddenNewPassword(),
                                                        validator: (String? val){
                                                          return controller.isValidPassword(val!) ? null: CommonLang.passwordMoreThanEight.tr();

                                                        },
                                                  )),
                                              controller.isHiddenNewPassword)
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          width: 20.w,
                                        )),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              text: CommonLang.newPasswordAgain
                                                  .tr(),
                                              textStyle: TextStyles.textMedium18
                                                  .copyWith(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 12,
                                                      color: Colors.black
                                                          .withOpacity(.6))),
                                          ObxValue<RxBool>(
                                              (state) => CustomTextFieldContainer(
                                                CustomTextFormField(
                                                  hint: '',
                                                  controller: controller.newPasswordAgain,
                                                  onSave: (String? val) {},
                                                  inputType: TextInputType.visiblePassword,
                                                  obscureText: true,
                                                  obscuringCharacter: "•",
                                                  isHiddenPassword: state.value,
                                                  validator: (String? val){
                                                    return controller.isValidPassword(val!) ? null: CommonLang.passwordMoreThanEight.tr();

                                                  },
                                                  onTapShowHidePassword: () => controller.changeIsHiddenAgainPassword(),
                                                )
                                              ),
                                          controller.isHiddenAgainPassword)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 50.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Expanded(
                                      child: SizedBox(),
                                    ),
                                    Obx(() {
                                      if(controller.isLoading.value){
                                        return const Center(
                                          child: SpinKitCircle(color: Color(ColorCode.blue)),
                                        );
                                      }else{
                                        return CustomButton(
                                          onPressed: () {
                                            if ((formKey.currentState?.validate() ?? false)) {
                                                formKey.currentState?.save();
                                                if(controller.newPassword.text.isEmpty || controller.newPasswordAgain.text.isEmpty){
                                                  controller. updateProfile();
                                                }else{
                                                  if(controller.newPassword.text == controller.newPasswordAgain.text){
                                                    if(controller.newPassword.text.length > 6){
                                                      controller. updateProfile();
                                                    }else{
                                                      Get.snackbar("", CommonLang.invalidPassword.tr());
                                                    }
                                                  }else{
                                                    Get.snackbar("", CommonLang.invalidConfirmPassword.tr());
                                                  }
                                                }
                                              }
                                          },
                                          height: 43.h,
                                          width: 140.w,
                                          backGroundColor:
                                          const Color(ColorCode.green),
                                          child: CustomText(
                                              text: CommonLang.save.tr(),
                                              textStyle: TextStyles.textMedium18
                                                  .copyWith(
                                                  fontSize: 16,
                                                  color: const Color(
                                                      ColorCode.white),
                                                  fontWeight: FontWeight.w500)),
                                        );
                                      }
                                    }),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                )),
            onLoading: const SpinKitCircle(color: Color(ColorCode.blue))));
  }
}
