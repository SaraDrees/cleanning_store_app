import 'package:cleanning_store_app/features/admin/add_type_tab/add_type_tab_binding.dart';
import 'package:cleanning_store_app/features/admin/add_user_tab/add_user_tab_binding.dart';
import 'package:cleanning_store_app/features/admin/products_tab/products_tab_binding.dart';
import 'package:get/get.dart';

import 'admin_controller.dart';

class AdminBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AdminController());
    ProductsTabBinding().dependencies();
    AddUserTabBinding().dependencies();
    AddTypeTabBinding().dependencies();
  }
}