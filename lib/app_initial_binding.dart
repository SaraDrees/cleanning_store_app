import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:get/get.dart';

class AppInitialBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(FirebaseStoreManager.firebaseStoreManager.init(),
    permanent: true
    );
  }

}