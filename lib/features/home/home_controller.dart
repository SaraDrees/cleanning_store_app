import 'package:cleanning_store_app/core/constant.dart';
import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:cleanning_store_app/core/models/type_model.dart';
import 'package:cleanning_store_app/core/request_mixin.dart';
import 'package:cleanning_store_app/core/state_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxStateController{

HomeController({required this.firebaseStore});

RxString selectedMainType = ''.obs;
RxString selectedSubType = ''.obs;

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
    selectedMainType.value = mainTypes.first.name;
    selectedSubType.value = subTypes.first.name;
    nameController.text = newProduct?.name??"";
    priceController.text = newProduct?.price.toString()??"";
    quantityController.text = newProduct?.quantity.toString()??"";
    super.onInit();
  }

void selectMainType(String value){
  selectedMainType.value = value ; 
  update(['new_product']);
}

void selectSubType(String value){
  selectedSubType.value = value ; 
  update(['new_product']);
}

Future addProduct(Product products) async {
  requestMethod(ids: ['new_product'],
  requestType: RequestType.postData, 
  function: () async {
    newProduct = Product(name: nameController.text,
        mainType: selectedMainType.value,
        productType: selectedSubType.value,
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

Future getMainTypes() async {
  requestMethod(ids: ['mainType'],
  requestType: RequestType.getData, 
  function: () async {
    Future.delayed(const Duration(seconds: 1), () { 
    mainTypes.addAll(List.generate(5, (index) => productType(name: 'type$index')));
    subTypes.addAll(List.generate(20, (index) => productType(name: 'subType$index')));
    });
  //  QuerySnapshot result = await firebaseStore.getData(Constant.typeCollectionPath);
  //   mainTypes.addAll(productTypeFromJson(result.docs.map((e) => e.data() as Map<String, dynamic>? ).toList()));
    return null ;
      });
 
}

void clearData(){
    newProduct = null ;
    nameController.text = '' ;
    priceController.text = '';
    quantityController.text = '';
    selectedMainType.value = mainTypes.first.name;
    selectedSubType.value = subTypes.first.name;
    update(['new_product']);
  }


}