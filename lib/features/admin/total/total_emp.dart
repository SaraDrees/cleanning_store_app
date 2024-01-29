import 'package:cleanning_store_app/core/view/main_scaffold.dart';
import 'package:cleanning_store_app/features/admin/total/total_controller.dart';
import 'package:cleanning_store_app/features/admin/total/total_tap/total_tap1.dart';
import 'package:cleanning_store_app/features/admin/total/total_tap/total_tap2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/app_colors.dart';
import '../../../core/routing/routes.dart';
import '../../../core/view/card_total.dart';
import '../products_tab/products_tab_controller.dart';

class TotalEmp extends GetView<TotalController> {
  const TotalEmp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: AppColors.colorPrimary,
              tabs: [
                Tab(
                  child: Text("Finished product".tr),
                ),
                Tab(
                  child: Text("Primary product".tr),
                ),

              ],
            ),

          ),
          body:  TabBarView(
            // controller: tabController,
            children:  [
              TotalTap1View(),
              TotalTap2View(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Get.offAndToNamed(AppRoutes.homePageRoute);

            },
            child: Icon(Icons.account_tree_outlined),
          ),

        )

    );
  }
}


