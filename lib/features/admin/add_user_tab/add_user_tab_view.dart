import 'package:cleanning_store_app/core/utitlities.dart';
import 'package:cleanning_store_app/core/view/app_button_widget.dart';
import 'package:cleanning_store_app/core/view/app_dropDown_widget.dart';
import 'package:cleanning_store_app/core/view/app_snackbar.dart';
import 'package:cleanning_store_app/core/view/app_text_field.dart';
import 'package:cleanning_store_app/core/view/app_text_field_title.dart';
import 'package:cleanning_store_app/core/view/loading_widget.dart';
import 'package:cleanning_store_app/core/widget_state_widget.dart';
import 'package:cleanning_store_app/features/admin/add_user_tab/add_user_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class AddUserTabView extends GetView<AddUserTabController>{
  AddUserTabView({super.key});

  final _useFormKey = GlobalKey<FormState>();
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StateBuilder<AddUserTabController>(
          id: "addUser",
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
                    AppTextFieldTitle(text: "userName".tr, isRequired: true),
                    AppTextField(
                      controller: controller.nameController,
                      validator: (value) => filedRequired(value),
                    ),
                    SizedBox(height: 2.2.h,),
                    AppTextFieldTitle(text: "userPassword".tr, isRequired: true),
                    AppTextField(
                      controller: controller.passwordController,
                      validator: (value) => filedRequired(value),
                    ),
                    SizedBox(height: 2.2.h,),
                    AppTextFieldTitle(text: "userRole".tr, isRequired: true),
                    AppDropDownWidget(selectedValue: controller.selectedRole, values: controller.roles, onSelect: (r) => controller.selectRole(r)),
                    SizedBox(height: 6.h,),
                    Visibility(
                      visible: widgetState == WidgetState.loading,
                      replacement: AppButtonWidget(
                        color: Color(0xff2BC990),
                          text: 'addUser'.tr, onPressed: (){
                        if(controller.selectedRole == null){
                          AppSnackbar.show( message: "select user's role" ,error: true);
                        } else if(_useFormKey.currentState!.validate()){
                          controller.addUser();
                        }}),
                      child: const LoadingWidget(),
                    ),
                  ],
                ),
              ),
            );}
      ),
    ) ;
  }

}