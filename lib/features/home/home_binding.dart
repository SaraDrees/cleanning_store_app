import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/features/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController(firebaseStore: FirebaseStoreManager.firebaseStoreManager));
  }

}