import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/widgets/custom_text.dart';

class ContactsWidget extends StatelessWidget {
  const ContactsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: 120.w,
                  minWidth: 100.w
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  iconWidet(AppAssets.callcalling()),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textHeadingWidget("${CommonLang.phone.tr()}:"),
                        SizedBox(
                          height: 15.h,
                        ),
                        textValueWidget(
                          "996 920033354",
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        textValueWidget(
                          "996 0538005581",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: 120.w,
                  minWidth: 100.w
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  iconWidet(AppAssets.mail()),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textHeadingWidget("${CommonLang.mail.tr()}:"),
                        SizedBox(
                          height: 15.h,
                        ),
                        textValueWidget(
                          "Asset@tammem.com.sa"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: 120.w,
                  minWidth: 100.w
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  iconWidet(AppAssets.location()),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textHeadingWidget("${CommonLang.address.tr()}:"),
                        SizedBox(
                          height: 15.h,
                        ),
                        textValueWidget(
                          "الرياض، حي الملك فهد، طريق العليا العام",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(

              constraints: BoxConstraints(
                  maxWidth: 120.w,
                  minWidth: 100.w
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textHeadingWidget("${CommonLang.socialMedia.tr()}:"),
                  SizedBox(
                    height: 15.h,
                  ),
                  Wrap(
                    children: [
                      iconWidet(AppAssets.twitter()),
                      SizedBox(
                        width: 8.w,
                      ),
                      iconWidet(AppAssets.instagram()),
                      SizedBox(
                        width: 8.w,
                      ),
                      iconWidet(AppAssets.bell()),
                      SizedBox(
                        width: 8.w,
                      ),
                      iconWidet(AppAssets.facebook())
                    ],
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  iconWidet(String appAsset) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(ColorCode.gray4)),
      child: Image.asset(
        appAsset,
        // color: Color(ColorCode.blue),
      ),
    );
  }

  textHeadingWidget(String text) {
    return CustomText(
      text: text,
      textAlign: TextAlign.start,
      textStyle: TextStyles.textMedium18.copyWith(
        color: Color(ColorCode.blue),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  textValueWidget(String text) {
    return CustomText(
      text: text,
      textAlign: TextAlign.start,
      maxLines: 4,
      textStyle: TextStyles.textMedium18.copyWith(
        color: Color(ColorCode.gray7),
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
