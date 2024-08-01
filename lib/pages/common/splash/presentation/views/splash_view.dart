import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/pages/common/support/presentation/controllers/support_controller.dart';
import 'package:property_managment/resources/common_assets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/drawer_widget.dart';

import '../controllers/splash_controller.dart';


class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image:  AssetImage(AppAssets.backgroundSplash()),fit: BoxFit.cover)
      ),
      child: Center(
        child: Image.asset(
            AppAssets.logo()
        ),
      ),
    );
  }
}
