import 'package:cleanning_store_app/core/utitlities.dart';
import 'package:cleanning_store_app/core/view/app_button_widget.dart';
import 'package:cleanning_store_app/core/view/app_text_field.dart';
import 'package:cleanning_store_app/core/view/app_text_field_title.dart';
import 'package:cleanning_store_app/core/view/loading_widget.dart';
import 'package:cleanning_store_app/core/widget_state_widget.dart';
import 'package:cleanning_store_app/features/admin/add_type_tab/add_type_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class AddTypeTabView extends GetView<AddTypeTabController>{
  AddTypeTabView({super.key});

  final _useFormKey = GlobalKey<FormState>();
   
  @override
  Widget build(BuildContext context) {
    return StateBuilder<AddTypeTabController>(
    id: "addType",
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
              AppTextFieldTitle(text: "selectType".tr, isRequired: true),
              AppTextField(
                controller: controller.typeController,
                validator: (value) => filedRequired(value),
                ),
              // AppDropDownWidget(selectedValue: controller.selectedType, values: controller.types, 
              // onSelect: (t) => controller.selectType(t)),
               SizedBox(height: 6.h,),
               Visibility(
                visible: widgetState == WidgetState.loading,
                 replacement: AppButtonWidget(
                   color: Color(0xff2BC990),
                     text: 'addType'.tr, onPressed: (){
                  // if(controller.selectedType == null){
                  //   AppSnackbar.show( message: "selectUserType".tr ,error: true);
                  // } else 
                 if(_useFormKey.currentState!.validate()){
                        controller.addType();
                      }}),
                child: const LoadingWidget(),
               ),
             ],
          ),
        ),
      );}
     ) ;
  }

}