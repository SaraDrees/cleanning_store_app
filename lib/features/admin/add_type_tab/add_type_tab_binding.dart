import 'package:cleanning_store_app/features/admin/add_type_tab/add_type_tab_controller.dart';
import 'package:get/get.dart';

class AddTypeTabBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddTypeTabController(firebaseStore: Get.find()),fenix: true);
  }

}