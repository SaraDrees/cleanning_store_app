import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:cleanning_store_app/core/view/card_product.dart';
import 'package:cleanning_store_app/core/widget_state_widget.dart';
import 'package:cleanning_store_app/features/admin/products_tab/products_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductsTabViewIP extends GetView<ProductsTabController>{


  @override
  Widget build(BuildContext context) {
    return StateBuilder<ProductsTabController>(
        id: "products",
        builder: (widgetState, controller) {
          return Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: ListView.separated(
                separatorBuilder: (cnt,i){
                  return Container(
                    height: 1.5.h,
                  );
                },
                itemCount: controller.inPData.length,
                itemBuilder: (context,i){
                  return CardProduct(product: controller.inPData[i], index: i,color: AppColors.colorPrimary,);
                }),
          );}
    ) ;
  }

}