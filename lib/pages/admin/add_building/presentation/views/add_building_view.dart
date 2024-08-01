import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/add_building/presentation/controllers/add_building_controller.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/widgets/custom_button.dart';
import 'package:property_managment/widgets/custom_drop_down_widget.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';

class AddBuildingView extends GetView<AddBuildingController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: const Color(ColorCode.white),
        appBar: AppBar(
          backgroundColor: const Color(ColorCode.gray4),
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.r),
              child: InkWell(
                onTap: () => Get.rootDelegate. offNamed(Routes.REALESTATES),
                child: const Icon(
                  Icons.close,
                  color: Color(ColorCode.blue),
                ),
              ),
            )
          ],
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                AppAssets.building(),
              ),
              const SizedBox(
                width: 4,
              ),
              CustomText(
                text: CommonLang.addNewBuilding.tr(),
                textAlign: TextAlign.start,
                textStyle: TextStyles.textMedium18.copyWith(
                  color: const Color(ColorCode.blue),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(12.r),
          child: controller.obx((state) => Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(ColorCode.gray4),
                    ),
                    child: Center(
                      child: Image.asset(
                        AppAssets.building(),
                        color: const Color(ColorCode.blue),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  CustomText(
                      text: CommonLang.realEstateData.tr(),
                      textStyle: TextStyles.textMedium18.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black
                      )
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: CommonLang.realEstateName.tr(),
                                          textStyle: TextStyles.textMedium18.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Colors.black.withOpacity(.6)
                                          )
                                      ),
                                      CustomTextFieldContainer(CustomTextFormField(
                                        hint: "",
                                        onSave: (String? val) {
                                          // controller.email = val!;
                                        },
                                        onChange: (text){
                                          if(controller.isEditing){
                                            controller.createRealStateModel.name = text;
                                          }
                                        },
                                        validator: (txt) {
                                          if (txt!.isEmpty) {
                                            return CommonLang.reqField.tr();
                                          }
                                          return null;
                                        },
                                        controller: controller.realEstateNameController,
                                        inputType: TextInputType.text,
                                      ))
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: CommonLang.instrumentNumber.tr(),
                                          textStyle: TextStyles.textMedium18
                                              .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Colors.black.withOpacity(.6))),
                                      CustomTextFieldContainer(CustomTextFormField(
                                        hint: '',
                                        onSave: (String? val) {
                                          // controller.email = val!;
                                        },
                                        onChange: (text){
                                          if(controller.isEditing){
                                            controller.createRealStateModel.identifier = text;
                                          }
                                        },
                                        validator: (txt) {
                                          if (txt!.isEmpty) {
                                            return CommonLang.reqField.tr();
                                          }
                                          return null;
                                        },
                                        controller: controller.instrumentNumberController,
                                        inputType: TextInputType.number,
                                      ))
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: CommonLang.city.tr(),
                                          textStyle: TextStyles.textMedium18
                                              .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Colors.black
                                                  .withOpacity(.6))),
                                      const SizedBox(height: 10,),
                                      Obx(() => CustomDropDownWidget<String>(
                                          value: controller.selectedCity.value,
                                          items: controller.cities ?? [],
                                          // label: CommonLang.realEstate.tr(),
                                          onRemove: () {
                                            controller.selectedCity.value =
                                            "";
                                            controller.cityNameController.text = "";
                                          },
                                          onChange: (val) {
                                            // if(controller.isEditing){
                                            //   controller.addMaintenanceRequest.realStateId = val?.id ?? -1;
                                            // }
                                            controller.selectedCity.value = val!;
                                            controller.cityNameController.text = val!;

                                          }))



                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: CommonLang.district.tr(),
                                          textStyle: TextStyles.textMedium18
                                              .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Colors.black
                                                  .withOpacity(.6))),
                                      const SizedBox(height: 10,),
                                      Obx(() => CustomDropDownWidget<String>(
                                          value: controller.selectedNeighborhoods.value,
                                          items: controller.neighborhoods ?? [],
                                          // label: CommonLang.realEstate.tr(),
                                          onRemove: () {
                                            controller.selectedNeighborhoods.value =
                                            "";
                                            controller.districtNameController.text = "";
                                          },
                                          onChange: (val) {
                                            // if(controller.isEditing){
                                            //   controller.addMaintenanceRequest.realStateId = val?.id ?? -1;
                                            // }
                                            controller.selectedNeighborhoods.value = val!;
                                            controller.districtNameController.text = val!;

                                          }))



                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: CommonLang.realEstateType.tr(),
                                          textStyle: TextStyles.textMedium18
                                              .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Colors.black
                                                  .withOpacity(.6))),
                                      const SizedBox(height: 10,),

                                      Obx(() => CustomDropDownWidget<String>(
                                          value: controller.selectedPropertyTypes.value,
                                          items: controller.propertyTypes ?? [],
                                          // label: CommonLang.realEstate.tr(),
                                          onRemove: () {
                                            controller.selectedPropertyTypes.value =
                                            "";
                                            controller.realEstateTypeController.text = "";
                                          },
                                          onChange: (val) {
                                            // if(controller.isEditing){
                                            //   controller.addMaintenanceRequest.realStateId = val?.id ?? -1;
                                            // }
                                            controller.selectedPropertyTypes.value = val!;
                                            controller.realEstateTypeController.text = val!;

                                          }))

                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: CommonLang.realEstateTypeUse.tr(),
                                          textStyle: TextStyles.textMedium18
                                              .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Colors.black
                                                  .withOpacity(.6))),
                                      const SizedBox(height: 10,),
                                      Obx(() => CustomDropDownWidget<String>(
                                          value: controller.selectePropertyUsage.value,
                                          items: controller.propertyUsage ?? [],
                                          // label: CommonLang.realEstate.tr(),
                                          onRemove: () {
                                            controller.selectePropertyUsage.value =
                                            "";
                                            controller.realEstateUsageController.text = "";
                                          },
                                          onChange: (val) {
                                            // if(controller.isEditing){
                                            //   controller.addMaintenanceRequest.realStateId = val?.id ?? -1;
                                            // }
                                            controller.selectePropertyUsage.value = val!;
                                            controller.realEstateUsageController.text = val!;

                                          }))


                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: CommonLang.area.tr(),
                                          textStyle: TextStyles.textMedium18
                                              .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Colors.black
                                                  .withOpacity(.6))),
                                      // const SizedBox(height: 10,),
                                      CustomTextFieldContainer(CustomTextFormField(
                                        hint: "",
                                        onSave: (String? val) {
                                          // controller.email = val!;
                                        },
                                        onChange: (text){
                                          if(controller.isEditing){
                                            controller.createRealStateModel.area = double.tryParse(text!);
                                          }
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly,
                                        ],
                                        validator: (txt) {
                                          if (txt!.isEmpty) {
                                            return CommonLang.reqField.tr();
                                          }
                                          return null;
                                        },
                                        controller: controller.areaController,
                                        inputType: TextInputType.number,
                                      ))


                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Obx((){
                                  return Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            text: CommonLang.ownerOfProperty.tr(),
                                            textStyle: TextStyles.textMedium18
                                                .copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: Colors.black
                                                    .withOpacity(.6))),
                                        const SizedBox(height: 10,),

                                        CustomDropDownWidget<Users>(
                                            value: controller.selectedOwner.value,
                                            items: controller.ownersList ?? [],
                                            // label: CommonLang.ownerOfProperty.tr(),
                                            validator: (user){
                                              if (user == null) {
                                                return CommonLang.reqField.tr();
                                              }
                                              return null;
                                            },
                                            onRemove: (){
                                              controller.selectedOwner.value = Users();
                                              controller.update();
                                            },
                                            onChange: (val) {
                                              if(controller.isEditing){
                                                controller.createRealStateModel.ownerId = val?.id ?? -1;
                                              }
                                              controller.selectedOwner.value = val ?? Users();
                                              controller.update();
                                            }
                                        ),
                                      ],
                                    ),
                                  );
                                }),

                              ],
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: controller.obx((state){
                                return Column(
                                  children: [
                                    CustomButton(
                                      onPressed: () {
                                        if ((controller.formKey.currentState?.validate() ?? false))  {
                                         controller. formKey.currentState?.save();

                                         if(controller.selectedCity.value == ""||controller.selectedNeighborhoods.value == ""|| controller.selectedPropertyTypes.value == ""){
                                           Get.snackbar("", CommonLang.notEmpty.tr());
                                         }else{
                                           if(controller.isEditing){
                                             controller.editRealState(controller.createRealStateModel);
                                           }else{
                                             controller.setRequestModel();
                                           }
                                         }

                                        }
                                      },
                                      height: 43.h,
                                      width: 140.w,
                                      backGroundColor:
                                      const Color(ColorCode.green),
                                      child: CustomText(
                                          text: controller.isEditing? CommonLang.update.tr() : CommonLang.add.tr(),
                                          textStyle: TextStyles.textMedium18.copyWith(
                                              fontSize: 16,
                                              color: const Color(ColorCode.white),
                                              fontWeight: FontWeight.w500)
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    if(controller.isEditing)
                                      CustomButton(
                                        onPressed: () {
                                          controller.deleteRealState();
                                        },
                                        height: 43.h,
                                        width: 140.w,
                                        backGroundColor: const Color(ColorCode.red2),
                                        child: CustomText(
                                            text: CommonLang.delete.tr(),
                                            textStyle: TextStyles.textMedium18.copyWith(
                                                fontSize: 16,
                                                color: const Color(ColorCode.white),
                                                fontWeight: FontWeight.w500)
                                        ),
                                      ),
                                  ],
                                );
                              },onLoading: const Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child:  SpinKitCircle(color: Color(ColorCode.blue)),
                              )
                              ),
                            ),
                          ],
                        ),
                      )
                  )
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),onLoading: const SpinKitCircle(color: Color(ColorCode.primary),)),
        )
    );
  }
}
