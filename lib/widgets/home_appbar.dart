import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/common/home/presentation/controllers/home_controller.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';
import 'package:property_managment/widgets/custom_button.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  HomeAppBar({
    Key? key,
    required this.height,
    required this.onTap,
    required this.showMenu,
     this.onChange,
  this.onDelete
    // required this.child
  }) : super(key: key);

  final double height;
  final  onTap;
  final bool showMenu;
  final  onChange;
  final  onDelete;

  @override
  Size get preferredSize => Size.fromHeight(height);
  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  // final Widget child;
TextEditingController textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: widget.preferredSize,
        child: AppBar(
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center
            ,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    SizedBox(
                      // width: 100.w,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        child: Image.asset(AppAssets.logo(),width: 150,height: 150, ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: InkWell(
                          onTap: widget.onTap,
                          child: Image.asset(AppAssets.menu())),
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    Expanded(
                      child:
                      AuthService.to.userInfo?.result?.data?.role == "admin"
                        ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 10),
                          // height: 60,
                          child: CustomButton(
                              onPressed: () {
                                Get.rootDelegate. offNamed(Routes.CREATE_CONTRACT);
                              },
                              backGroundColor: const Color(ColorCode.green),
                            height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AppAssets.note()),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Expanded(
                                    child: CustomText(
                                        text: CommonLang.createNewContract.tr(),
                                        textStyle: TextStyles.textMedium18
                                            .copyWith(
                                                fontSize: 14,
                                                overflow: TextOverflow.fade,
                                                color: const Color(
                                                    ColorCode.white),
                                                fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                            ),
                        )
                        : const SizedBox(),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 3,
                        child:widget.onChange ==null ? SizedBox(): Container(
                          padding: const EdgeInsets.all(4),
                          height: 60,
                          child: CustomTextFormField(
                            hint: CommonLang.search.tr(),
                            onSave: (String? val) {
                              // controller.email = val!;
                            },
                            controller: textEditingController,
                            onChange: widget.onChange,
                            inputType: TextInputType.text,

                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        textEditingController.clear();
                                      });
                                      widget.onDelete();
                                    },
                                    child: Icon(Icons.clear,color: Color(ColorCode.red),)),
                                const SizedBox(width: 8,),
                                Image.asset(AppAssets.search(), height: 15,width: 15,fit: BoxFit.fill,),
                                const SizedBox(width: 8,),

                              ],
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        child: Image.asset(AppAssets.notification()),
                      ),
                      InkWell(
                        onTap: ()=>  Get.rootDelegate.offNamed(
                            Routes.PROFILE
                        ),
                        child: Row(
                          children: [
                            Image.asset(AppAssets.profile()),
                            const SizedBox(
                              width: 8,
                            ),
                            CustomText(
                              text:AuthService.to.updateProfileProfile != null ?AuthService.to.updateProfileProfile?.result?.data?.name ??"": AuthService.to.userInfo?.result?.data?.name ??"",
                              textAlign: TextAlign.center,
                              textStyle: TextStyles.textMedium18.copyWith(
                                color: const Color(ColorCode.gray),
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(ColorCode.white),
          elevation: 1,
        ));
  }


}
