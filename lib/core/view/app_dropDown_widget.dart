// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppDropDownWidget extends StatelessWidget {
  const AppDropDownWidget({required this.selectedValue , required this.values, required this.onSelect, super.key});

 final selectedValue;
 final values ;
 final Function(dynamic) onSelect;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
          width: double.infinity,
          height: 6.5.h,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: AppColors.enabledBorder,width: 0.5)
          ),
          margin: EdgeInsets.only(top: 1.1.h),
          padding: EdgeInsets.symmetric(vertical: 0 , horizontal: 3.8.w),
          child: DropdownButton(
                value: selectedValue,
                isExpanded: true,
                underline: const SizedBox(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize:12.sp, color: AppColors.textColorPrimary) ,
                items: List.generate(values.length,
                (i) => DropdownMenuItem(
                value: values[i],
                child: Text(values is List<String> ? values[i] : values[i].name)))  , 
              onChanged: (g)=> onSelect(g))
        );
  }
}