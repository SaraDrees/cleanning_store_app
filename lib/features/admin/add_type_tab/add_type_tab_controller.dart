import 'package:cleanning_store_app/core/constant.dart';
import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/models/type_model.dart';
import 'package:cleanning_store_app/core/request_mixin.dart';
import 'package:cleanning_store_app/core/state_mixin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTypeController extends GetxStateController{
  AddTypeController({required this.firebaseStore});

  FirebaseStoreManager firebaseStore;
  productType ?subType;
  TextEditingController subTypeController = TextEditingController();
  List<productType> mainTypes = [] ;
  productType ?selectedMainType ;


  @override
  void onInit()async {
    await getMTypes();
    subTypeController.text = subType?.name??"";
    super.onInit();

  }

  void addSubType() async {
  requestMethod(
      ids: ["addSubType"],
      requestType: RequestType.postData,
      function: () async {
        subType = productType(name: subTypeController.text);
      await firebaseStore.addData(data: subType?.toJson(),
         collectionPath: '${Constant.mainTypeCollectionPath}/${selectedMainType?.id}/${Constant.subTypeCollectionPath}',
          message: 'typeAdded'.tr, errorMessage: 'FailedToAddType'.tr
         );
       clearData();
        return null;
      });
  }
  void deleteSubType() async {
    requestMethod(
        ids: ["addSubType"],
        requestType: RequestType.postData,
        function: () async {
          subType = productType(name: subTypeController.text);
          await firebaseStore.addData(data: subType?.toJson(),
              collectionPath: '${Constant.mainTypeCollectionPath}/${selectedMainType?.id}/${Constant.subTypeCollectionPath}',
              message: 'typeAdded'.tr, errorMessage: 'FailedToAddType'.tr
          );
          clearData();
          return null;
        });
  }




  void clearData(){
    subType = null ;
    subTypeController.text = '' ;
    selectedMainType = null;
    update(['addSubType', 'mainType']);
  }


  void selectMainType(productType value){
    selectedMainType = value ;
    update(['mainType']);
  }

  Future getMTypes() async {
    requestMethod(ids: ['mainType'],
        requestType: RequestType.getData,
        function: () async {
          QuerySnapshot result = await firebaseStore.getData(Constant.mainTypeCollectionPath);
          mainTypes.clear();
          mainTypes.addAll(productTypeFromJson(result.docs));
          selectedMainType = mainTypes.first;
          return null ;
        });
  }


}