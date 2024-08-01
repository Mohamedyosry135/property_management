import 'package:flutter_svg/flutter_svg.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/common/support/presentation/controllers/support_controller.dart';
import 'package:property_managment/resources/common_assets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/widgets/custom_button.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';
import 'package:property_managment/widgets/drawer_widget.dart';
import 'package:themed/themed.dart';

import '../controllers/login_controller.dart';
import 'package:universal_html/html.dart' as html;


class LoginView extends GetView<LoginController> {
   LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // html.window.location.reload();

    return Scaffold(
      backgroundColor: const Color(ColorCode.white),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Form(
            key: formKey,
            child: Row(
              children: [
                SizedBox(
                  width: Get.width /2,
                  height: double.infinity,
                  child: Center(
                    child: SingleChildScrollView(

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          CustomText(
                                text: CommonLang.welcomeBack.tr(),
                                textStyle: TextStyles.textBold25.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Color(ColorCode.blue),
                                  fontSize: 24
                                )),
                          SizedBox(height: 27.h,),
                          CustomText(
                              text: CommonLang.enterLoginInformation.tr(),
                              textStyle: TextStyles.textMedium18.copyWith(
                                color: Color(ColorCode.gray)
                              )),
                          SizedBox(height: 60.h,),
                          Center(
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
                                SizedBox(
                                  width:Get.width /4,
                                  child: CustomTextFieldContainer(
                                      CustomTextFormField(
                                        hint: '',
                                        onSave: (String? val) {
                                          controller.email = val!;
                                        },
                                        inputType: TextInputType.emailAddress,
                                        validator: (String? val){
                                          return controller.isValidEmail(val!) ? null: CommonLang.invalidMail.tr();
                                        },

                                      )
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 25.h,),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: CommonLang.password.tr(),
                                    textStyle: TextStyles.textMedium18.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(.6)
                                    )),
                                SizedBox(
                                  width:Get.width /4,

                                  child:                           ObxValue<RxBool>((state) {
                                    return CustomTextFieldContainer(CustomTextFormField(
                                      hint: CommonLang.password.tr(),
                                      onSave: (String? val) {
                                        controller.password = val!;
                                      },
                                      inputType: TextInputType.visiblePassword,
                                      obscureText: true,
                                      obscuringCharacter: "•",
                                      isHiddenPassword: state.value,
                                      validator: (String? val){
                                        return controller.isValidPassword(val!) ? null: CommonLang.invalidPassword.tr();
                                      },
                                      onTapShowHidePassword: () =>
                                          controller.changeIsHiddenPassword(),
                                    ));
                                  }, controller.isHiddenPassword),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 32.h,),


                          controller.obx((state) => CustomButton(
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if ((formKey.currentState?.validate() ?? false)) {
                                formKey.currentState?.save();
                                controller.onLoginClicked();
                              }
                            },
                            height: 50,
                            width:Get.width /4,

                            backGroundColor: const Color(ColorCode.blue),
                            child: CustomText(
                                text: CommonLang.login.tr(),
                                textStyle: TextStyles.textMedium18.copyWith(
                                  fontSize: 16,
                                  color: Color(ColorCode.white),
                                  fontWeight: FontWeight.w500
                                )
                            ),
                          ),onLoading:  const SpinKitCircle(color: Color(ColorCode.blue)))
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  width: Get.width /2,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(image:  AssetImage(AppAssets.backgroundSplash()),fit: BoxFit.cover,)
                  ),
                  child: Center(
                    child: Image.asset(AppAssets.whiteLogo(), width: 300.w,height: 300.h,),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
