import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class AppTextFieldTitle extends StatelessWidget {
 AppTextFieldTitle({super.key , required this.text , required this.isRequired});

  String text ;
  bool isRequired ;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.8.w , vertical: 1.h),
      child: Opacity(
                  opacity: 0.70,
                  child: RichText(
                    text: TextSpan(
                    children: [TextSpan(
                      text: text,
                      style:  TextStyle(
                      color: AppColors.textColorPrimary,
                      fontSize: 11.2.sp,
                      fontWeight: FontWeight.w600,
                      )),
                      TextSpan(
                      text: isRequired ? "*" : "",
                      style:  TextStyle(
                      color: AppColors.redColor,
                      fontSize: 9.2.sp,
                      fontWeight: FontWeight.w600,
                      )),
                      ]),
                  )),
    );
  }
}