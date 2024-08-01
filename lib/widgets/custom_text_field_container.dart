import 'package:property_managment/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldContainer extends StatelessWidget {
  final CustomTextFormField? textFieldWidget;
  final double marginStart;
  final double marginEnd;
  const CustomTextFieldContainer(this.textFieldWidget, {Key? key,this.marginEnd = 0.0,this.marginStart = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 10,start: marginStart,bottom: marginEnd,end: marginStart),
      padding: EdgeInsets.zero,
      child: textFieldWidget,
    );
  }
}
