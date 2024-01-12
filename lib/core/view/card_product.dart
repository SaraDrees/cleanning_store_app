import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CardProduct extends StatelessWidget {

  CardProduct({super.key, required this.product, required this.index});

  Product product ;
  int index;

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5.0,
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: 2.8.w),
      child: Container(
        decoration:  BoxDecoration(color: AppColors.colorPrimary,
        borderRadius: BorderRadius.circular(10)),
        child: _buildListTile(context),
      ),
    );
  }


  Widget _buildListTile(BuildContext context){
    return ListTile(
        contentPadding: EdgeInsets.only(left:5.w, right: 1.w, top: 1.h, bottom: 2.h),
        leading: Container(
          height: double.infinity,
          padding: EdgeInsets.only(right: 3.w),
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(width: 1.0, color: AppColors.whiteColor))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('#${index+1}', style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
                fontSize: 16.sp
              ),),
            ],
          ),
        ),
        title: Text(
          product.name,
          style: TextStyle(color: AppColors.whiteColor, 
          fontSize: 16.sp,
          fontWeight: FontWeight.bold),
        ),
        // subtitle: Padding(
        //   padding: EdgeInsets.only(top: 0.5.h),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(product.mainType,style: TextStyle(fontSize: 12.sp, color: AppColors.whiteColor)),
        //       Text(product.subType,style: TextStyle(fontSize: 12.sp, color: AppColors.whiteColor)),
        //     ],
        //   ),
        // ),
        trailing:
            Container(
              padding: EdgeInsets.only(top: 0.5.h),
              width: 27.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     const Icon(Icons.attach_money , color: Colors.yellow,),
                     SizedBox(width: 1.w,),
                    Text('${product.invoiceNumber} UAE' , style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.whiteColor,
                    ),),
                    ],
                  ),
                      SizedBox(height: 0.1.h,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 1.w,),
                     const Icon(Icons.auto_awesome_motion_outlined , color: Colors.yellow, size: 22,),
                     SizedBox(width: 1.w,),
                    Text('${product.quantity} Piece' , style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.whiteColor
                    ),),
                    ],
                  ),
                ],
              ),
            )
        
        );
  } 

}
