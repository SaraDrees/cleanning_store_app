import 'package:cleanning_store_app/core/view/main_scaffold.dart';
import 'package:cleanning_store_app/features/admin/products_tab/primary_product/product_primary.dart';
import 'package:cleanning_store_app/features/admin/products_tab/products_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AdminPrimary extends StatefulWidget {
  const AdminPrimary({super.key});

  @override
  State<AdminPrimary> createState() => _AdminPrimaryState();
}

class _AdminPrimaryState extends State<AdminPrimary> with TickerProviderStateMixin {

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
          body:  ProductsTabViewPrimary(),
          title: 'products'.tr,) );
  }
}