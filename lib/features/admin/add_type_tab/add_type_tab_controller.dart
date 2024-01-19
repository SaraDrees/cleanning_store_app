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
  productType ?type;
  TextEditingController typeController = TextEditingController();
  List<String> types = ['mainType'.tr,'subType'.tr];
  String? selectedType ;
  List<productType> mainTypes = [] ;
  productType ?selectedMainType ;


  @override
  void onInit()async {
    await getMainTypes();
    typeController.text = type?.name??"";
    selectedMainType = mainTypes.first;
    super.onInit();

  }

  void addType() async {
  requestMethod(
      ids: ["addType"],
      requestType: RequestType.postData,
      function: () async {
        type = productType(name: typeController.text);
      //  await Future.delayed(const Duration(seconds: 1));
      await firebaseStore.addData(data: type?.toJson(),
         collectionPath: Constant.mainTypeCollectionPath,
          message: 'typeAdded'.tr, errorMessage: 'FailedToAddType'.tr
         );
       clearData();
        return null;
      });
  }

  void selectType(String r){
    selectedType = r ;
    update(['addType']);
  }

  void clearData(){
    type = null ;
    typeController.text = '' ;
    selectedType = null;
    update(['addType']);
  }


  void selectMainType(productType value){
    selectedMainType = value ;
    //get subType by mainTypeId
    update(['addType']);
  }

  Future getMainTypes() async {
    requestMethod(ids: ['addType'],
        requestType: RequestType.getData,
        function: () async {
          QuerySnapshot result = await firebaseStore.getData(Constant.mainTypeCollectionPath);
          mainTypes.clear();
          mainTypes.addAll(productTypeFromJson(result.docs));
          return null ;
        });
  }


}