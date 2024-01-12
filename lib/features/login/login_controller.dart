import 'package:cleanning_store_app/core/constant.dart';
import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/models/user_model.dart';
import 'package:cleanning_store_app/core/request_mixin.dart';
import 'package:cleanning_store_app/core/routing/routes.dart';
import 'package:cleanning_store_app/core/state_mixin.dart';
import 'package:cleanning_store_app/core/view/app_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class LoginController extends GetxStateController{
  
  LoginController({required this.firebaseStore});

  User? user ;
  List<User> users = [];
  FirebaseStoreManager firebaseStore;


  @override
  void onInit() {
    super.onInit();
    }

  Future login() async {
  requestMethod(ids: ['login'],
  requestType: RequestType.getData, 
  function: () async {
  QuerySnapshot result = await firebaseStore.getData(Constant.userCollectionPath);
  users.clear();
  print('${result.docs.map((e) => e.data() as Map<String, dynamic>? ).toList()}');
  users.addAll(userFromJson((result.docs.map((e) => e.data() as Map<String, dynamic>? ).toList())));
  User? temp = users.firstWhereOrNull((element) => (element.name == user?.name.removeAllWhitespace)&& (element.password == user?.password.removeAllWhitespace));
  if(temp == null){
    AppSnackbar.show(message: "FailedToLogin".tr, error: true);
  }else if((user?.name == 'ahmad' && user?.password == '123456') || (temp.role??false)){
    Get.offAndToNamed(AppRoutes.adminPageRoute);
  }else{
    Get.offAndToNamed(AppRoutes.homePageRoute);
  }
    return null ;
      });
 
}


}