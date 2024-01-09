import 'package:cleanning_store_app/core/constant.dart';
import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/models/user_model.dart';
import 'package:cleanning_store_app/core/request_mixin.dart';
import 'package:cleanning_store_app/core/state_mixin.dart';
import 'package:cleanning_store_app/core/view/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUserTabController extends GetxStateController{
  AddUserTabController({required this.firebaseStore});

  FirebaseStoreManager firebaseStore;
  User ?user;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<String> roles = ['employee','admin'];
  String? selectedRole ;


  @override
  void onInit() {
    nameController.text = user?.name??"";
    passwordController.text = user?.password??"";
    super.onInit();
  }

  void addUser() async {
  requestMethod(
      ids: ["addUser"],
      requestType: RequestType.postData,
      function: () async {
        user = User(name: nameController.text, password: passwordController.text, role: true);
      await firebaseStore.addData(data: user?.toJson(),
         collectionPath: Constant.userCollectionPath,
          message: 'userAdded'.tr, errorMessage: 'FailedToAddUser'.tr
         );
       clearData();
       AppSnackbar.show(message:"userAdded".tr);
        return null;
      });
  }

  void selectRole(String r){
    selectedRole = r ;
    update(['addUser']);
  }

  void clearData(){
    user = null ;
    nameController.text = '' ;
    passwordController.text = '';
    selectedRole = null;
    update(['addUser']);
  }



}