import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_managment/pages/common/home_page/presentation/views/home_page_view.dart';
import 'package:property_managment/widgets/drawer_widget.dart';
import 'package:property_managment/widgets/home_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
RxBool showMenu = true.obs;

class CustomBuildWidget extends StatefulWidget {
  CustomBuildWidget({Key? key , required this.index,required this.viewPage,this.onChange, this.onDelete }) : super(key: key);
    int index;
    final Widget viewPage;
    final  onChange;
  final onDelete;
  @override
  State<CustomBuildWidget> createState() => _CustomBuildWidgetState();
}

class _CustomBuildWidgetState extends State<CustomBuildWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  changeIsShowMenu() => showMenu.toggle();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      // drawer: CustomDrawer(),
      // endDrawerEnableOpenDragGesture: true,

        appBar: HomeAppBar(height: 60.h,
            onTap:(){
          setState(() {
            showMenu.value =
            !showMenu.value;
            print(showMenu.value);
          });
          // homeController.update();
        },
          onChange: widget.onChange,
          onDelete: widget.onDelete,
        showMenu: showMenu.value ,
        ),
        body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Obx(() => showMenu.value
                  ?  CustomDrawer(index: widget.index,width: MediaQuery.of(context).size.width*.17,)
                  : CustomDrawer(index: widget.index,width: 90, onTap: (){
                setState(() {
                  showMenu.value =
                  !showMenu.value;
                  print(showMenu.value);
                });
              },)),
             SizedBox(width: 12,),
             Expanded(
               child:  widget.viewPage  ,
             )
            ]));
  }

}
