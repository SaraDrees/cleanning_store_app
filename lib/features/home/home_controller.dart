import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

HomeController({required this.firebaseStore});

CollectionReference product = FirebaseFirestore.instance.collection('product');

RxString selectedMainType = ''.obs;
RxString selectedProductType = ''.obs;

List<String> mainTypes = ["A" , "B", "c" , "D"];
List<String> productTypes = ["a" , "b", "c" , "d"];


FirebaseStoreManager firebaseStore;
Product? newProduct ;

@override
  void onInit() {
    // TODO: implement onInit
    selectedMainType.value = mainTypes.first;
    selectedProductType.value = productTypes.first;
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
 await Future.delayed(const Duration(seconds: 2));
 //await firebaseStore.addData(newProduct?.toJson(), product.productCollectionPath);

  return product
      .add({
    'name': products.name,
    'price': products.price,
    'quantity': products.quantity,
    'mainType': selectedMainType.value,
    'productType':selectedProductType.value
  })
      .then((value) => print("Product Added"))
      .catchError((error) => print("Failed to add user: $error"));



}



}