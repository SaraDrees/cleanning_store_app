import 'package:cleanning_store_app/core/view/card_product.dart';
import 'package:cleanning_store_app/core/view/card_total.dart';
import 'package:cleanning_store_app/core/widget_state_widget.dart';
import 'package:cleanning_store_app/features/admin/products_tab/products_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../total_controller.dart';

class TotalTap1View extends GetView<TotalController>{
  const TotalTap1View({super.key});

  @override
  Widget build(BuildContext context) {
    return StateBuilder<TotalController>(
        id: "products",
        builder: (widgetState, controller) {
          return Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {

                return CardTotal();
              },
            ),
          );}
    ) ;
  }

}
