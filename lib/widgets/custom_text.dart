import 'package:property_managment/consts/text_styles.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final int maxLines;
  final   TextStyle textStyle;
  final TextAlign textAlign;

   const CustomText(
      {Key? key,
      required this.text,
      required this.textStyle ,
      this.maxLines = 2,
      this.textAlign = TextAlign.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
    );
  }
}
