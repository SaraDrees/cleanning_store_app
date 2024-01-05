import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/features/home/home_controller.dart';
import 'package:get/get.dart';

import 'admin_controller.dart';

class AdminBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AdminController(firebaseStore: FirebaseStoreManager.firebaseStoreManager));
  }
}