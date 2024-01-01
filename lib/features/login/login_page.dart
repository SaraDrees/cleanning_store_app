import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:cleanning_store_app/core/assets.dart';
import 'package:cleanning_store_app/core/routing/routes.dart';
import 'package:cleanning_store_app/core/utitlities.dart';
import 'package:cleanning_store_app/core/view/app_button_widget.dart';
import 'package:cleanning_store_app/core/view/app_text_field.dart';
import 'package:cleanning_store_app/features/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class LoginPage extends GetView<LoginController>{
   LoginPage({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5.3.w, vertical: 18.h),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               SizedBox(
                // height: 20.h,
                child: Image.asset(Assets.loginVactor, fit: BoxFit.cover,)),
               SizedBox(height: 4.6.h,),
              Text(
              'Welcome Back!',
              style: TextStyle(
              color: AppColors.colorPrimary,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              ),
              ),
              SizedBox(height: 1.h,),
              Text(
              'Please Log into your existing account',
              style: TextStyle(
              color: AppColors.colorPrimary,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              ),
              ),
               SizedBox(height: 4.5.h,),
              AppTextField(
                controller: nameController, hintText: 'nameHint'.tr,
                validator: (value) => filedRequired(value),
                ),
                SizedBox(height: 1.2.h,),
              AppTextField(
                controller: passwordController, hintText: 'password'.tr,
                validator: (value) => filedRequired(value),
                ),
               SizedBox(height: 3.h,),
               AppButtonWidget(text: 'login'.tr, onPressed: (){
                    if(_formKey.currentState!.validate()){
                      Get.toNamed(AppRoutes.homePageRoute);
                    }
                  }),
             ],
          ),
        ),
      ),
    );

  }

}