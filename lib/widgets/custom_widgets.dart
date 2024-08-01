import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/widgets/custom_button.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';

dateColumn(String title) {
  return DataColumn(
      label: Expanded(
        child: CustomText(
          text: title,
          maxLines: 3,
          textAlign: TextAlign.start,
          textStyle: TextStyles.textMedium18
              .copyWith(color: Color(ColorCode.white), fontSize: 12),
        ),
      ));
}



lastDataCell(String title,{Function()? onTap}) {
  return DataCell(Row(
    children: [
      GestureDetector(
        onTap: onTap ?? (){},
        child: Image(image: AssetImage(AppAssets.dots())),
      )
    ],
  ));
}

dataCell(String title) {
  return DataCell(
      CustomText(
    text: title,
    maxLines: 20,
    textAlign: TextAlign.center,
    textStyle: TextStyles.textMedium18
        .copyWith(color: Color(ColorCode.black3), fontSize: 12),
  )

  );
}

dataInputCell( onSave) {
  return DataCell(
      Container(
        constraints: BoxConstraints(
          maxWidth: 300,
          minWidth: 200
        ),
        child: CustomTextFieldContainer(
            CustomTextFormField(
              hint: "",
              onSave:onSave ,
              maxLines: 3,
              inputType: TextInputType.multiline,

            )
        ),
      ));
}


doneCell(Color color) {
  return DataCell(
    Image.asset(
      AppAssets.dollarCircle() ,
      color:color ,
    ),);

}

deleteCell(var onPressed) {
  return DataCell(
    IconButton(
      onPressed: onPressed, icon: Icon(Icons.delete_forever,color: Color(ColorCode.red),),
    ),);
}
preveiwCell(var onPressed) {
  return DataCell(
    IconButton(
      onPressed: onPressed, icon: Icon(Icons.library_books,color: Color(ColorCode.primary),),
    ),);
}

lastDataCellWithClick(String title,var onTap) {
  return DataCell(Row(
    children: [
      Expanded(
        child: CustomText(
          text: title,
          textStyle: TextStyles.textMedium18
              .copyWith(color: Color(ColorCode.black3), fontSize: 12),
        ),
      ),
      SizedBox(width: 8.w,),
      InkWell(
          onTap: onTap,
          child: Image(image: AssetImage(AppAssets.dots())))
    ],
  ));
}
String convertArabicToEnglish(String arabicNumeral) {
  var symbols = <String, String>{
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',
  };

  for (var entry in symbols.entries) {
    arabicNumeral = arabicNumeral.replaceAll(entry.key, entry.value);
  }

  return arabicNumeral;
}


void deleteItem(BuildContext context, String title,String content,String cancel,String action, var onTap) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(40),

        title: CustomText(
            text: title,
            textStyle: TextStyles.textMedium18.copyWith(
                fontSize: 30,
                color: const Color(ColorCode.primary),
                fontWeight: FontWeight.w700)
        ),
        content: CustomText(
        text: content,
        textStyle: TextStyles.textMedium18.copyWith(
      fontSize: 22,
          color: const Color(ColorCode.primary),
      fontWeight: FontWeight.w500)
      ),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          CustomButton(
            onPressed: onTap,
            // height: 43.h,
            width: 50.w,
            height: 40,

            backGroundColor: const Color(ColorCode.primary),
            child: CustomText(
                text: action,
                textStyle: TextStyles.textMedium18.copyWith(
                    fontSize: 16,
                    color: const Color(ColorCode.white),
                    fontWeight: FontWeight.w500)
            ),
          ),

          CustomButton(
            onPressed: () {
            Get.back();
            },
            // height: 43.h,
            width: 50.w,
            height: 40,
            backGroundColor: const Color(ColorCode.red2),
            child: CustomText(
                text: cancel,
                textStyle: TextStyles.textMedium18.copyWith(
                    fontSize: 16,
                    color: const Color(ColorCode.white),
                    fontWeight: FontWeight.w500)
            ),
          ),
        ],
      );
    },
  );
}