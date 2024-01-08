import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:cleanning_store_app/features/admin/add_type_tab/add_type_tab_view.dart';
import 'package:cleanning_store_app/features/admin/add_user_tab/add_user_tab_view.dart';
import 'package:cleanning_store_app/features/admin/products_tab/products_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> with TickerProviderStateMixin {
 
 late TabController tabController ;

 @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  indicatorColor: AppColors.colorPrimary,
                  tabs: [
                    Tab(
                      child: Text("products".tr),
                    ),
                    Tab(
                      child: Text("addUser".tr),
                    ),
                    Tab(
                      child: Text("addType".tr),
                    )
                  ],
                ),

              ),
              body:  TabBarView(
                // controller: tabController,
                    children:  [
                      const ProductsTabView(),
                      AddUserTabView(),
                      AddTypeTabView()
                    ],
              ),


        ));
  }
}
