import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:cleanning_store_app/core/request_mixin.dart';
import 'package:cleanning_store_app/core/state_mixin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsTabController extends GetxStateController{
  ProductsTabController({required this.firebaseStore});

  FirebaseStoreManager firebaseStore;

  late List<Product> data ;

  @override
  void onInit() {
    super.onInit();
    data = [];
    getProduct();
  }

   void getProduct() async {
    try{
      requestMethod(
          ids: ["products"],
          requestType: RequestType.getData,
          function: () async {
            QuerySnapshot products = await firebaseStore.getData("product");
            data.addAll(productFromJson((products.docs.map((e) => e.data() as Map<String, dynamic>? ).toList())));
            update(['products']);
            return null;
          });
    }catch(e){
      print("sssssssssssssssssssssssssssssssssssssssssssssssssssssssss     $e" );
    }
  

  }
}