import 'package:cleanning_store_app/features/admin/add_user_tab/add_user_tab_controller.dart';
import 'package:get/get.dart';

class AddUserTabBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddUserTabController(firebaseStore: Get.find()),fenix: true);
  }

}