import 'package:cleanning_store_app/core/utitlities.dart';
import 'package:cleanning_store_app/core/view/app_button_widget.dart';
import 'package:cleanning_store_app/core/view/app_text_field.dart';
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
    return StateBuilder<AddUserTabController>(
    id: "addUser",
    disableState: true,
    initialWidgetState: WidgetState.loaded,
     builder: (widgetState, controller) { 
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5.3.w, vertical: 15.h),
        child: Form(
          key: _useFormKey,
          child: Column(
            children: <Widget>[
              AppTextField(
                controller: controller.nameController, hintText: 'userName'.tr,
                validator: (value) => filedRequired(value),
                ),
                SizedBox(height: 3.h,),
              AppTextField(
                controller: controller.passwordController, hintText: 'userPassword'.tr,
                validator: (value) => filedRequired(value),
                ),
                SizedBox(height: 4.h,),
              AppTextField(
                controller: controller.passwordController, hintText: 'confirmPassword'.tr,
                validator: (value) => filedRequired(value),
                ),
               SizedBox(height: 6.h,),
               Visibility(
                visible: widgetState == WidgetState.loading,
                 replacement: AppButtonWidget(text: 'addUser'.tr, onPressed: (){
                      if(_useFormKey.currentState!.validate()){
                        controller.addUser();
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