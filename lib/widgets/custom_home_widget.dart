import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/resources/common_assets.dart';

class CustomHomeWidget extends StatelessWidget {
  final Widget stackContainer;
  final Function() onNotificationTap;
  const CustomHomeWidget({Key? key,required this.stackContainer,required this.onNotificationTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      clipBehavior: Clip.none,
      children: [
        SizedBox(
            width: double.infinity,
            height: Get.height/2.2,
            child: Image.asset(
              AppAssets.homeImage(),
              fit: BoxFit.cover,
            )
        ),
        PositionedDirectional(
          end: 15,
          top: 25,
          child: GestureDetector(
            onTap: onNotificationTap,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(ColorCode.white),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Stack(
                children:  [
                  Image.asset(
                    AppAssets.notificationIcon(),
                    width: 25,
                    height: 25,
                  ),
                  PositionedDirectional(
                    end: 2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(ColorCode.red)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        PositionedDirectional(
          end: 0,
          top: 30,
          start: 0,
          child: Image.asset(
            AppAssets.appIcon(),
            height: 50,
            width: 50,
          ),
        ),
        stackContainer
      ],
    );
  }
}
