import 'package:cleanning_store_app/core/utitlities.dart';
import 'package:cleanning_store_app/core/view/app_button_widget.dart';
import 'package:cleanning_store_app/core/view/app_text_field.dart';
import 'package:cleanning_store_app/core/view/app_text_field_title.dart';
import 'package:cleanning_store_app/core/view/loading_widget.dart';
import 'package:cleanning_store_app/core/view/main_scaffold.dart';
import 'package:cleanning_store_app/core/widget_state_widget.dart';
import 'package:cleanning_store_app/features/admin/add_type_tab/add_type_tab_controller.dart';
import 'package:cleanning_store_app/features/admin/add_type_tab/taps/tap_product.dart';
import 'package:cleanning_store_app/features/admin/add_type_tab/taps/tap_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_colors.dart';

// ignore: must_be_immutable
class AddTypeView extends GetView<AddTypeController>{
  AddTypeView({super.key});

  final _useFormKey = GlobalKey<FormState>();
   
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MainScaffold(
        title: "aaaaaa",
        body: Scaffold(
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
            body: TabBarView(
              // controller: tabController,
              children:  [
                AddTypeTabView(),
                AddProductTabView(),

              ],
            )),
      )

    ) ;
  }

}