import 'package:cleanning_store_app/core/constant.dart';
import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/models/user_model.dart';
import 'package:cleanning_store_app/core/request_mixin.dart';
import 'package:cleanning_store_app/core/routing/routes.dart';
import 'package:cleanning_store_app/core/state_mixin.dart';
import 'package:get/get.dart';

class LoginController extends GetxStateController{
  
  LoginController({required this.firebaseStore});

  User? user;
  FirebaseStoreManager firebaseStore;


  @override
  void onInit() {
    super.onInit();
    }

  Future login() async {
  requestMethod(ids: ['login'],
  requestType: RequestType.postData, 
  function: () async {
   await firebaseStore.addData(collectionPath:Constant.userCollectionPath,
    data: user?.toJson(), message: 'loginSuccessflly'.tr , errorMessage: 'FailedToLogin'.tr
   );
    Get.toNamed(AppRoutes.homePageRoute);
    return null ;
      });
 
}


}