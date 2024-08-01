
import 'package:property_managment/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {


   const CustomAppbar({Key? key, this.title  ,required this.height,
    this.actions , this.backgroundColor,this.elevation=1,
    this.implyLeading=false,this.leading, this.radius = 0, this.flexibleSpace,})
      : super(key: key);

  final Color? backgroundColor;
  final  double height;
  final double elevation;
  final bool implyLeading;
  final double radius;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? title;
  final Widget? flexibleSpace;


  @override
  Widget build(BuildContext context) {
    return AppBar(

      title:title,
      automaticallyImplyLeading: implyLeading,
      backgroundColor:  backgroundColor,
      actions: actions ?? [],
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(radius),
        ),
      ),
      flexibleSpace: flexibleSpace,
      elevation: 0,
      centerTitle: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor:   Colors.transparent,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

