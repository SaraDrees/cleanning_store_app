import 'package:cleanning_store_app/core/view/card_product.dart';
import 'package:cleanning_store_app/core/widget_state_widget.dart';
import 'package:cleanning_store_app/features/admin/products_tab/products_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsTabView extends GetView<ProductsTabController>{
  const ProductsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return StateBuilder<ProductsTabController>(
    id: "products",
     builder: (widgetState, controller) { 
      return ListView.separated(
       separatorBuilder: (cnt,i){
         return Container(
           height: 30,
         );
       },
       itemCount: controller.data.length,
         itemBuilder: (context,i){
           return CardProduct(name: controller.data[i].name,mainType: controller.data[i].mainType,productType: controller.data[i].subType,price: controller.data[i].price,quantity: controller.data[i].quantity,);
     });}
     ) ;
  }

}