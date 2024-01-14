import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:cleanning_store_app/features/admin/add_type_tab/add_type_tab_view.dart';
import 'package:cleanning_store_app/features/admin/add_user_tab/add_user_tab_view.dart';
import 'package:cleanning_store_app/features/admin/products_tab/products_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'finished_product/tap-in_s.dart';
import 'finished_product/tap-out_s.dart';



class ProductsTabView extends StatefulWidget {
  const ProductsTabView({super.key});

  @override
  State<ProductsTabView> createState() => _ProductsTabViewState();
}

class _ProductsTabViewState extends State<ProductsTabView> with TickerProviderStateMixin {

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
              ProductsTabViewIS(),
              ProductsTabViewOS(),
            ],
          ),

        ));
  }
}