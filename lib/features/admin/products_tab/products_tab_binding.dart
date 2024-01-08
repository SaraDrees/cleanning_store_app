import 'package:cleanning_store_app/features/admin/products_tab/products_tab_controller.dart';
import 'package:get/get.dart';

class ProductsTabBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsTabController(firebaseStore: Get.find()),fenix: true);
  }

}