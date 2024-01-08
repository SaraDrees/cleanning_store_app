import 'package:cleanning_store_app/core/constant.dart';
import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:cleanning_store_app/core/request_mixin.dart';
import 'package:cleanning_store_app/core/state_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxStateController{

HomeController({required this.firebaseStore});

RxString selectedMainType = ''.obs;
RxString selectedProductType = ''.obs;

List<String> mainTypes = ["A" , "B", "c" , "D"];
List<String> productTypes = ["a" , "b", "c" , "d"];


FirebaseStoreManager firebaseStore;
Product? newProduct ;

TextEditingController nameController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController quantityController = TextEditingController();

@override
  void onInit() {
    // TODO: implement onInit
    selectedMainType.value = mainTypes.first;
    selectedProductType.value = productTypes.first;
    nameController.text = newProduct?.name??"";
    priceController.text = newProduct?.price.toString()??"";
    quantityController.text = newProduct?.quantity.toString()??"";
    super.onInit();
  }

void selectMainType(String value){
  selectedMainType.value = value ; 
  update(['new_product']);
}

void selectProductType(String value){
  selectedProductType.value = value ; 
  update(['new_product']);
}

Future addProduct(Product products) async {
  requestMethod(ids: ['new_product'],
  requestType: RequestType.postData, 
  function: () async {
    newProduct = Product(name: nameController.text,
        mainType: selectedMainType.value,
        productType: selectedProductType.value,
        price: int.parse( priceController.text),
        quantity: int.parse( quantityController.text));
    await firebaseStore.addData( data:newProduct?.toJson(), 
    collectionPath: Constant.productCollectionPath,
    message: 'productAdded'.tr, errorMessage: 'FailedToAddProduct'.tr
    );
    clearData();
    return null ;
      });
 
}

void clearData(){
    newProduct = null ;
    nameController.text = '' ;
    priceController.text = '';
    quantityController.text = '';
    selectedMainType.value = mainTypes.first;
    selectedProductType.value = productTypes.first;
    update(['new_product']);
  }


}