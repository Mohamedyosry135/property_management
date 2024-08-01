import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:property_managment/pages/common/maintenance_requests/presentation/controllers/add_maintenance_request_controller.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/widgets/custom_button.dart';
import 'package:property_managment/widgets/custom_drop_down_widget.dart';
import 'package:property_managment/widgets/custom_text.dart';
import 'package:property_managment/widgets/custom_text_field_container.dart';
import 'package:property_managment/widgets/custom_text_form_field.dart';
import 'package:property_managment/widgets/custom_widgets.dart';

class AddMaintenanceRequestView
    extends GetView<AddMaintenanceRequestController> {
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
                onTap: () => Get.rootDelegate. offNamed(Routes.MAINTAINCE_REQUESTS_VIEW),
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
                color: Color(ColorCode.blue),
              ),
              const SizedBox(
                width: 4,
              ),
              CustomText(
                text: CommonLang.maintenanceRequest.tr(),
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
        body: controller.obx((state) => Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            children: [
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
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() => CustomDropDownWidget<ContractModel>(
                                        value: controller.selectedContractModel.value,
                                        items: controller.contractModel ?? [],
                                        label: CommonLang.contractNumber.tr(),
                                        onRemove: () {
                                          controller.selectedContractModel.value =
                                              ContractModel();
                                          controller.update();
                                        },
                                        onChange: (val) {
                                          // if(controller.isEditing){
                                          //   controller.addMaintenanceRequest.realStateId = val?.id ?? -1;
                                          // }
                                          controller.selectedContractModel.value = val!;
                                          print( controller.selectedContractModel.value.toJson());
                                          controller.changedSelectedContractID(controller.selectedContractModel.value);
                                          controller.update();
                                        }))

                                    // CustomText(
                                    //     text: CommonLang.contractNumber.tr(),
                                    //     textStyle: TextStyles.textMedium18
                                    //         .copyWith(
                                    //         fontWeight: FontWeight.w500,
                                    //         fontSize: 12,
                                    //         color: Colors.black
                                    //             .withOpacity(.6))),
                                    // CustomTextFieldContainer(CustomTextFormField(
                                    //   hint: "",
                                    //   onSave: (String? val) {
                                    //     // controller.email = val!;
                                    //   },
                                    //   inputType: TextInputType.number,
                                    // ))
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
                                        text: CommonLang.realEstateType.tr(),
                                        textStyle: TextStyles.textMedium18
                                            .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black
                                                .withOpacity(.6))),
                                    CustomTextFieldContainer(CustomTextFormField(
                                      hint: '',
                                      onSave: (String? val) {
                                        // controller.email = val!;
                                      },
                                      controller: controller.realEstateTypeController,
                                      readOnly:true,

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
                                        text: CommonLang.unitType.tr(),
                                        textStyle: TextStyles.textMedium18
                                            .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black
                                                .withOpacity(.6))),
                                    CustomTextFieldContainer(CustomTextFormField(
                                      hint: '',
                                      onSave: (String? val) {
                                        // controller.email = val!;
                                      },
                                      controller: controller.unitTypeController,
                                      readOnly:true,
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
                                        text: CommonLang.unitArea.tr(),
                                        textStyle: TextStyles.textMedium18
                                            .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black
                                                .withOpacity(.6))),
                                    CustomTextFieldContainer(CustomTextFormField(
                                      hint: '',
                                      onSave: (String? val) {
                                        // controller.email = val!;
                                      },
                                      controller: controller.unitAreaController,
                                      readOnly:true,
                                      inputType: TextInputType.text,
                                    ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: CommonLang.owner.tr(),
                                        textStyle: TextStyles.textMedium18
                                            .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black
                                                .withOpacity(.6))),
                                    CustomTextFieldContainer(CustomTextFormField(
                                      hint: "",
                                      onSave: (String? val) {
                                        // controller.email = val!;
                                      },
                                      controller: controller.ownerController,
                                      readOnly:true,
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
                                        text: CommonLang.tenant.tr(),
                                        textStyle: TextStyles.textMedium18
                                            .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black
                                                .withOpacity(.6))),
                                    CustomTextFieldContainer(CustomTextFormField(
                                      hint: '',
                                      onSave: (String? val) {
                                        // controller.email = val!;
                                      },
                                      controller: controller.representativeOwnerController,
                                      readOnly:true,
                                      inputType: TextInputType.text,
                                    ))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [



                                    CustomText(
                                        text: CommonLang.building.tr(),
                                        textStyle: TextStyles.textMedium18.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black.withOpacity(.6))
                                    ),
                                    CustomTextFieldContainer(
                                        CustomTextFormField(
                                          hint: '',
                                          validator: (txt) {
                                            if (txt!.isEmpty) {
                                              return CommonLang.reqField.tr();
                                            }
                                            return null;
                                          },
                                          readOnly:true,
                                          onChange: (text){

                                          },

                                          controller: controller.buildingController,
                                          onSave: (String? val) {
                                            // controller.email = val!;
                                          },
                                          inputType: TextInputType.text,
                                        )),
                                  ],
                                ),
                              )

                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: CommonLang.orderDetails.tr(),
                                        textStyle: TextStyles.textMedium18.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black.withOpacity(.6))
                                    ),
                                    CustomTextFieldContainer(
                                        CustomTextFormField(
                                          hint: '',
                                          validator: (txt) {
                                            if (txt!.isEmpty) {
                                              return CommonLang.reqField.tr();
                                            }
                                            return null;
                                          },

                                          controller: controller.orderDetailsController,
                                          // controller: controller.detailsController,
                                          onSave: (String? val) {
                                            controller.orderDetailsController.text = val!;
                                          },
                                          // maxLines: 6,
                                          inputType: TextInputType.multiline,
                                        )),
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
                                        text: CommonLang.mobileNumber.tr(),
                                        textStyle: TextStyles.textMedium18
                                            .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black
                                                .withOpacity(.6))),
                                    CustomTextFieldContainer(CustomTextFormField(
                                      hint: '',
                                      onSave: (String? val) {
                                        // controller.email = val!;
                                      },
                                      controller: controller.mobileNumberController,
                                      readOnly:true,
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
                                        text: CommonLang.email.tr(),
                                        textStyle: TextStyles.textMedium18
                                            .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black
                                                .withOpacity(.6))),
                                    CustomTextFieldContainer(CustomTextFormField(
                                      hint: '',
                                      onSave: (String? val) {
                                        // controller.email = val!;
                                      },
                                      controller: controller.emailController,
                                      readOnly:true,
                                      inputType: TextInputType.emailAddress,
                                    ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: controller.obx((state) {
                              return CustomButton(
                                onPressed: () {
                                  if (controller.formKey.currentState!.validate()) {
                                    if(controller.isEditing){
                                      controller.editMaintenanceRequest(controller.addMaintenanceRequest);
                                    }else{
                                      controller.setRequestModel();
                                    }
                                  }
                                },
                                height: 43.h,
                                width: 140.w,
                                backGroundColor:
                                const Color(ColorCode.green),
                                child: CustomText(
                                    text: CommonLang.add.tr(),
                                    textStyle: TextStyles.textMedium18.copyWith(
                                        fontSize: 16,
                                        color: Color(ColorCode.white),
                                        fontWeight: FontWeight.w500)
                                ),
                              );
                            },onLoading: const SpinKitCircle(color: Color(ColorCode.blue))),
                          )
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),onLoading: SpinKitCircle(color: Color(ColorCode.blue),)));
  }

}
