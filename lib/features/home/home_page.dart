import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:cleanning_store_app/core/utitlities.dart';
import 'package:cleanning_store_app/core/view/app_button_widget.dart';
import 'package:cleanning_store_app/core/view/app_dropDown_widget.dart';
import 'package:cleanning_store_app/core/view/app_text_field.dart';
import 'package:cleanning_store_app/core/view/app_text_field_title.dart';
import 'package:cleanning_store_app/core/view/loading_widget.dart';
import 'package:cleanning_store_app/core/widget_state_widget.dart';
import 'package:cleanning_store_app/features/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController>{

  final _formKey = GlobalKey<FormState>();

  HomePage({super.key});

  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 9.h , horizontal: 5.3.w),
        child: StateBuilder<HomeController>(
          id: 'new_product',
          disableState: true,
          initialWidgetState: WidgetState.loaded,
          builder: (widgetState, controller){
            return Form(
              key: _formKey,
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                        'addProduct'.tr,
                        style: TextStyle(
                        color: AppColors.colorPrimary,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        ),
                        ),
                      ),
                     SizedBox(height: 3.5.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: AppTextFieldTitle( text:"mainType".tr, isRequired: true,),
                      ),
                      StateBuilder<HomeController>(
                        id: 'mainType',
                        builder: (widgetState, controller) {
                          return AppDropDownWidget(selectedValue: controller.selectedMainType.value, values: controller.mainTypes,
                           onSelect: (value) => controller.selectMainType(value));
                        }
                      ),
                     SizedBox(height: 3.5.h,),
                     Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: AppTextFieldTitle( text:"subType".tr, isRequired: true,),
                      ),
                      AppDropDownWidget(selectedValue: controller.selectedSubType.value, values: controller.subTypes,
                       onSelect: (value) => controller.selectSubType(value)),
                     SizedBox(height: 3.5.h,),
                     Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: AppTextFieldTitle( text:"productName".tr, isRequired: true,),
                      ),
                      AppTextField(controller: controller.nameController, validator: (value) => filedRequired(value),),
                      SizedBox(height: 3.5.h,),
                     Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: AppTextFieldTitle( text:"quantity".tr, isRequired: true,),
                      ),
                      AppTextField(controller: controller.quantityController, validator: (value) => validateNumbers(value??""),
                      keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 3.5.h,),
                     Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: AppTextFieldTitle( text:"price".tr, isRequired: true,),
                      ),
                      AppTextField(controller: controller.priceController, validator: (value) => validateNumbers(value??""),
                      keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 3.5.h,),
                       Visibility(
                        visible: widgetState == WidgetState.loading,
                         replacement: AppButtonWidget(text: 'input'.tr, onPressed: ()async {
                                 if(_formKey.currentState!.validate() && controller.selectedMainType.value.isNotEmpty 
                                 && controller.selectedSubType.value.isNotEmpty){
                                  await controller.addProduct(controller.newProduct!);
                              }
                          }),
                          child: const LoadingWidget(),
                       )
                    ],
                  ),
            );
          }
        )
      ),
    );
  }

}
