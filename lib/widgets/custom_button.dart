import 'package:property_managment/consts/colors.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color backGroundColor;
  final double elevation;
  final double borderRadius;
  final double width;
  final double height;
  final BoxDecoration? decoration;

  const CustomButton(
    {Key? key,
      required this.child,
      required this.onPressed,
      this.backGroundColor = const Color(ColorCode.orange),
      this.elevation = 0,
      this.borderRadius = 12.0,
      this.width = double.infinity,
      this.height = 55,
      this.decoration
    }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      padding: EdgeInsets.zero,
      child: TextButton(
        onPressed: onPressed,
        // child: CustomText(text, textStyle: TextStyles.textSmall),
        child: child,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: backGroundColor,
          elevation: elevation,
        ),
      ),
    );
  }
}
