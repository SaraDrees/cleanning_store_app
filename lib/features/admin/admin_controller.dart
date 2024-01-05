import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class AdminController extends GetxController{

  AdminController({required this.firebaseStore});

  FirebaseStoreManager firebaseStore;
  
  late List data=['ll'];
  //late List product;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProduct();
    update(['n']);
  }


  Future getProduct() async {
    QuerySnapshot products = await FirebaseFirestore.instance.collection("product").get();
    data.addAll(products.docs);
    // data.forEach((element) {
    //   product.add(Product(name: element['name'], mainType: element['mainType'], productType: element['productType'], price: element['price'], quantity: element['quantity']));
    // });
    print(data);
    update(['n']);

  }


}