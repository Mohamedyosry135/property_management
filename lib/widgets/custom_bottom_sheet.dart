import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';

 customBottomSheet({
   required Widget bottomSheetBody,
   int backgroundColor = ColorCode.white,
   }) {
    return Get.bottomSheet(
      Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:  Color(backgroundColor),
        ),
        child: bottomSheetBody,
      ),
      backgroundColor:  Colors.transparent,
      barrierColor: const Color(ColorCode.black).withOpacity(.7),
      elevation: 0.0,
      isDismissible: false,
      persistent: true,
    );
}
