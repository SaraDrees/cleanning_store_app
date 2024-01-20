import 'package:cleanning_store_app/features/admin/total/total_controller.dart';
import 'package:cleanning_store_app/features/admin/total/total_tap/total_tap1.dart';
import 'package:cleanning_store_app/features/admin/total/total_tap/total_tap2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/app_colors.dart';
import '../../../core/view/card_total.dart';
import '../products_tab/products_tab_controller.dart';

class TotalView extends GetView<TotalController> {
  const TotalView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
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
              TotalTap1View(),
              TotalTap2View(),
            ],
          ),

        )
    );
  }
}
