import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:cleanning_store_app/core/utitlities.dart';
import 'package:cleanning_store_app/core/view/app_button_widget.dart';
import 'package:cleanning_store_app/core/view/app_snackbar.dart';
import 'package:cleanning_store_app/core/view/app_text_field.dart';
import 'package:cleanning_store_app/core/view/app_text_field_title.dart';
import 'package:cleanning_store_app/core/view/loading_widget.dart';
import 'package:cleanning_store_app/core/widget_state_widget.dart';
import 'package:cleanning_store_app/features/admin/add_type_tab/add_type_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/view/app_dropDown_widget.dart';

// ignore: must_be_immutable
class AddProductTabView extends GetView<AddTypeController>{
  AddProductTabView({super.key});

  final _useFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  StateBuilder<AddTypeController>(
        id: "addSubType",
        disableState: true,
        initialWidgetState: WidgetState.loaded,
        builder: (widgetState, controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 5.3.w, vertical: 15.h),
            child: Form(
              key: _useFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppTextFieldTitle(
                    text: "mainType".tr,
                    isRequired: true,
                  ),
                  StateBuilder<AddTypeController>(
                      id: 'mainType',
                      builder: (widgetState, controller) {
                        return AppDropDownWidget(
                            selectedValue: controller.selectedMainType,
                            values: controller.mainTypes,
                            onSelect: (value) =>
                                controller.selectMainType(value));
                      }),
                      SizedBox(height: 2.2.h,),
                  AppTextFieldTitle(text: "type".tr, isRequired: true),
                  AppTextField(
                    controller: controller.subTypeController,
                    validator: (value) => filedRequired(value),
                  ),
                  // AppDropDownWidget(selectedValue: controller.selectedType, values: controller.types,
                  // onSelect: (t) => controller.selectType(t)),
                  SizedBox(height: 6.h,),
                  Center(
                    child: Visibility(
                      visible: widgetState == WidgetState.loading&&controller.selectedMainType!=null,
                      replacement: AppButtonWidget(
                          color: AppColors.colorPrimary,
                          text: 'addType'.tr, onPressed: (){
                        if(controller.selectedMainType == null){
                          AppSnackbar.show( message: "selectUserType".tr ,error: true);
                        } else
                        if(_useFormKey.currentState!.validate()){
                          controller.addSubType();
                        }}),
                      child: const LoadingWidget(),
                    ),
                  ),
                ],
              ),
            ),
          );}
    ) ;
  }

}