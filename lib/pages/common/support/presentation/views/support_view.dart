import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/common/support/presentation/controllers/support_controller.dart';
import 'package:property_managment/pages/common/support/presentation/views/widgets/contact_widget.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/widgets/custom_build_widget.dart';
import 'package:property_managment/widgets/custom_button.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';

class SupportView extends GetView<SupportController> {
   SupportView({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CustomBuildWidget(
      index: 3,
      viewPage:Scaffold(
        backgroundColor: Color(ColorCode.gray4),
        body: Padding(
          padding: EdgeInsets.all(12.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      AppAssets.support(),
                      color: Color(ColorCode.blue),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomText(
                      text: CommonLang.support.tr(),
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
                  height: 12.h,
                ),
                Container(
                  padding: EdgeInsets.all(50.r),
                  decoration: BoxDecoration(
                      color: Color(ColorCode.white),
                      borderRadius: BorderRadius.circular(8.r)
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        ContactsWidget(),
                        SizedBox(
                          height: 44.h,
                        ),
                        Divider(
                          height: 1,
                          color: Color(ColorCode.gray8),

                        ),
                        SizedBox(
                          height: 44.h,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(ColorCode.gray4),
                              ),
                              child: Image.asset(
                                AppAssets.support() ,
                                color: Color(ColorCode.blue),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            CustomText(
                                text: CommonLang.sendMessage.tr(),
                                textStyle: TextStyles.textMedium18.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black
                                )),

                          ],
                        ),
                        SizedBox(
                          height: 50  .h,
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  CustomText(
                                      text: "${ CommonLang.message.tr()}*",
                                      textStyle: TextStyles.textMedium18.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(.6)
                                      )),
                                  CustomTextFieldContainer(
                                      CustomTextFormField(
                                        hint: '',
                                        controller: controller.messageController,
                                        onSave: (String? val) {
                                          controller.message =val!;
                                        },
                                        inputType: TextInputType.multiline,
                                        maxLines: 5,
                                        validator: (String? val){
                                          if (val!.isEmpty) {
                                            return CommonLang.reqField.tr();
                                          }
                                          return null;
                                        },

                                      )
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: SizedBox())
                          ],
                        ),
                        SizedBox(
                          height: 30  .h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            controller.obx((state) => CustomButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if ((formKey.currentState?.validate() ?? false)) {
                                  formKey.currentState?.save();
                                  controller.sendRequest();
                                }
                              },
                              height: 43.h,
                              width: 100.w,
                              backGroundColor: const Color(ColorCode.blue),
                              child: CustomText(
                                  text: CommonLang.send.tr(),
                                  textStyle: TextStyles.textMedium18.copyWith(
                                      fontSize: 16,
                                      color: Color(ColorCode.white),
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                            ),onLoading:  const SpinKitCircle(color: Color(ColorCode.blue))),

                            Expanded(
                              child: SizedBox(),
                            ),
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
        )

    ),

    );
  }
}
