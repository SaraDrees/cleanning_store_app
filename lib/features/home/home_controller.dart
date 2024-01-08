import 'package:cleanning_store_app/core/constant.dart';
import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:cleanning_store_app/core/models/type_model.dart';
import 'package:cleanning_store_app/core/request_mixin.dart';
import 'package:cleanning_store_app/core/state_mixin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxStateController{

HomeController({required this.firebaseStore});

productType ?selectedMainType ;
productType? selectedSubType;

List<productType> mainTypes = [] ;
List<productType> subTypes = [] ;


FirebaseStoreManager firebaseStore;
Product? newProduct ;

TextEditingController nameController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController quantityController = TextEditingController();

@override
  void onInit() async {
    // TODO: implement onInit
    await getMainTypes();
    selectedMainType = mainTypes.first;
    selectedSubType = subTypes.first;
    nameController.text = newProduct?.name??"";
    priceController.text = newProduct?.price.toString()??"";
    quantityController.text = newProduct?.quantity.toString()??"";
    super.onInit();
  }

void selectMainType(productType value){
  selectedMainType = value ;
  //get subType by mainTypeId
  update(['new_product']);
}

void selectSubType(productType value){
  selectedSubType = value ; 
  update(['new_product']);
}

Future addProduct(Product products) async {
  requestMethod(ids: ['new_product'],
  requestType: RequestType.postData, 
  function: () async {
    // newProduct = Product(name: nameController.text,
    //     mainType: selectedMainType,
    //     productType: selectedSubType,
    //     price: int.parse( priceController.text),
    //     quantity: int.parse( quantityController.text));
    await firebaseStore.addData( data:newProduct?.toJson(), 
    collectionPath: Constant.productCollectionPath,
    message: 'productAdded'.tr, errorMessage: 'FailedToAddProduct'.tr
    );
    clearData();
    return null ;
      });
 
}

Future getMainTypes() async {
  requestMethod(ids: ['mainType'],
  requestType: RequestType.getData, 
  function: () async {
  QuerySnapshot result = await firebaseStore.getData(Constant.typeCollectionPath);
   mainTypes.addAll(productTypeFromJson(result.docs));
    return null ;
      });
 
}

void clearData(){
    newProduct = null ;
    nameController.text = '' ;
    priceController.text = '';
    quantityController.text = '';
    selectedMainType = mainTypes.first;
    selectedSubType = subTypes.first;
    update(['new_product']);
  }


}