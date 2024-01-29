import 'package:cleanning_store_app/core/view/main_scaffold.dart';
import 'package:cleanning_store_app/features/admin/products_tab/products_tab_view.dart';

import 'package:cleanning_store_app/features/admin/total/total_view.dart';
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
        child: MainScaffold(
        body:  ProductsTabView(),
         title: "Store Page",) );
  }


}
