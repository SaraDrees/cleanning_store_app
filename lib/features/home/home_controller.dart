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
productType? selectedName;

List<productType> mainTypes = [] ;
List<productType> name = [] ;


FirebaseStoreManager firebaseStore;
Product? newProduct ;

TextEditingController nameController = TextEditingController();
TextEditingController invoiceNumberController = TextEditingController();
TextEditingController quantityController = TextEditingController();

@override
  void onInit() async {
    // TODO: implement onInit
    await getMainTypes();
    selectedMainType = mainTypes.first;
    selectedName = name.first;
    nameController.text = newProduct?.name??"";
    invoiceNumberController.text = newProduct?.invoiceNumber.toString()??"";
    quantityController.text = newProduct?.quantity.toString()??"";
    super.onInit();
  }

void selectMainType(productType value){
  selectedMainType = value ;
  getSubTypes(selectedMainType?.id??"");
  //get subType by mainTypeId
  update(['mainType']);
}

void selectSubType(productType value){
  selectedName = value ;
  update(['subType']);
}

Future addProduct({required String inOut}) async {
  requestMethod(ids: ['new_product'],
  requestType: RequestType.postData, 
  function: () async {
    newProduct = Product(
        empName: "othman",
        type: "",
        inOut: inOut,
        mainType: selectedMainType?.name??"",
        name: selectedName?.name??"",
        invoiceNumber: int.parse( invoiceNumberController.text),
        quantity: int.parse( quantityController.text),
        date: DateTime.now().toString()
    );
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
  QuerySnapshot result = await firebaseStore.getData(Constant.mainTypeCollectionPath);
  mainTypes.clear();
   mainTypes.addAll(productTypeFromJson(result.docs));
    return null ;
      });
}

Future getSubTypes(String mainTypeId) async {
  requestMethod(ids: ['subType'],
  requestType: RequestType.getData, 
  function: () async {
  QuerySnapshot result = await firebaseStore.getData('${Constant.mainTypeCollectionPath}/$mainTypeId/${Constant.subTypeCollectionPath}');
  name.clear();
  name.addAll(productTypeFromJson(result.docs));
  selectedName = null;
    return null ;
      });
}

void clearData(){
    newProduct = null ;
    nameController.text = '' ;
    invoiceNumberController.text = '';
    quantityController.text = '';
    selectedMainType = null;
    selectedName = null;
    update(['new_product']);
  }


}