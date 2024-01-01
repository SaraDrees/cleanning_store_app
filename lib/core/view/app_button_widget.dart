import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class AppButtonWidget extends StatelessWidget {
   AppButtonWidget({this.height, this.width , required this.text ,required this.onPressed ,super.key});

  double ? height,width;
  String text;
  final Function() onPressed ;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                width: width??double.infinity,
                height: height?? 6.5.h,
                child: ElevatedButton(
                  onPressed:() => onPressed(),
                 style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.colorPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))
                 ),
                  child: Text(
                  text,
                  style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  ),
                  ),
                 ),
              )
           ;
  }
}