import 'package:cleanning_store_app/core/constant.dart';
import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/models/type_model.dart';
import 'package:cleanning_store_app/core/request_mixin.dart';
import 'package:cleanning_store_app/core/state_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMTypeController extends GetxStateController{
  AddMTypeController({required this.firebaseStore});

  FirebaseStoreManager firebaseStore;
  productType ?type;
  TextEditingController typeController = TextEditingController();

  @override
  void onInit()async {
    typeController.text = type?.name??"";
    super.onInit();

  }

  void addType() async {
  requestMethod(
      ids: ["addMType"],
      requestType: RequestType.postData,
      function: () async {
        type = productType(name: typeController.text);
      await firebaseStore.addData(data: type?.toJson(),
         collectionPath: Constant.mainTypeCollectionPath,
          message: 'typeAdded'.tr, errorMessage: 'FailedToAddType'.tr
         );
       clearData();
        return null;
      });
  }


  void clearData(){
    type = null ;
    typeController.text = '' ;
    update(['addType']);
  }



}