import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:cleanning_store_app/features/admin/add_type_tab/add_type_tab_view.dart';
import 'package:cleanning_store_app/features/admin/add_user_tab/add_user_tab_view.dart';
import 'package:cleanning_store_app/features/admin/products_tab/finished_product/tap-in_s.dart';
import 'package:cleanning_store_app/features/admin/products_tab/finished_product/tap-out_s.dart';
import 'package:cleanning_store_app/features/admin/products_tab/primary_product/tap_in.dart';
import 'package:cleanning_store_app/features/admin/products_tab/primary_product/tap_out.dart';
import 'package:cleanning_store_app/features/admin/products_tab/products_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class ProductsTabViewPrimary extends StatefulWidget {
  const ProductsTabViewPrimary({super.key});

  @override
  State<ProductsTabViewPrimary> createState() => _ProductsTabViewPrimaryState();
}

class _ProductsTabViewPrimaryState extends State<ProductsTabViewPrimary> with TickerProviderStateMixin {

  late TabController tabController ;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: AppColors.colorPrimary,
              tabs: [
                Tab(
                  child: Text("input".tr),
                ),
                Tab(
                  child: Text("output".tr),
                ),

              ],
            ),

          ),
          body:  TabBarView(
            // controller: tabController,
            children:  [
              ProductsTabViewIP(),
              ProductsTabViewOP(),
            ],
          ),


        ));
  }
}