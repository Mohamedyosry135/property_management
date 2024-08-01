import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/buildings/presentation/views/buildings_view.dart';
import 'package:property_managment/pages/admin/control_board/presentation/views/control_board_view.dart';
import 'package:property_managment/pages/admin/owners_tenants/presentation/views/owners_view.dart';
import 'package:property_managment/pages/admin/representative_owners_tenants/presentation/views/representative_owners_view.dart';
import 'package:property_managment/pages/common/home/presentation/controllers/home_controller.dart';
import 'package:property_managment/pages/common/home_page/presentation/controllers/home_page_controller.dart';
import 'package:property_managment/pages/common/maintenance_requests/presentation/views/maintenance_requests_view.dart';
import 'package:property_managment/pages/common/profile/presentation/views/profile_view.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_widgets.dart';
import 'package:property_managment/widgets/drawer_widget.dart';
import 'package:property_managment/widgets/home_appbar.dart';

class HomePageView extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color(ColorCode.gray4),
        body: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    AppAssets.home(),
                    color: Color(ColorCode.blue),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  CustomText(
                    text: CommonLang.home.tr(),
                    textAlign: TextAlign.start,
                    textStyle: TextStyles.textMedium18.copyWith(
                      color: Color(ColorCode.blue),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),

              Expanded(
                  child: SingleChildScrollView(
                    child: DataTable(
                      border: TableBorder.all(width: 0,color: Colors.transparent),
                      decoration: BoxDecoration(
                        color: Color(ColorCode.blue),
                        border: Border.all(width: 1,color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      columns: <DataColumn>[
                        dateColumn(CommonLang.contractNumber.tr()),
                        dateColumn(CommonLang.lessor.tr()),
                        dateColumn(CommonLang.tenant.tr()),
                        dateColumn(CommonLang.realEstate.tr()),
                        dateColumn(CommonLang.contractStartingDate.tr()),
                        dateColumn(CommonLang.contractEndDate.tr()),
                        dateColumn(CommonLang.amount.tr()),
                      ],
                      rows: [1,2,3,4,5,6,7,8,9,10,12].map((e) => dataRow()).toList(),
                    ),
                  )),

              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ));
  }


  DataRow dataRow( ) {
    return DataRow(
      color: MaterialStatePropertyAll(Colors.white),
      cells: <DataCell>[
        dataCell("25125421"),
        dataCell("محمد ابراهيم محمد على"),
        dataCell("سيد عفيفي عبد الله"),
        dataCell("برج الريحان"),
        dataCell("15/03/2023"),
        dataCell("15/03/2024"),
        dataCell ("100.000 ريال"),
      ],
    );
  }


}
