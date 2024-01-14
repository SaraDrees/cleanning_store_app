import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:cleanning_store_app/core/models/product_name.dart';
import 'package:cleanning_store_app/core/request_mixin.dart';
import 'package:cleanning_store_app/core/state_mixin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/models/type_model.dart';

class ProductsTabController extends GetxStateController{
  ProductsTabController({required this.firebaseStore});

  FirebaseStoreManager firebaseStore;

  late List<Product> data ;
  late List<productType> mainType;
  late List<ProductName> names;

  @override
  void onInit() {
    super.onInit();
    data = [];
    mainType=[];
    names=[];
    getProduct();
  }

  void getProduct() async {
    try{
      requestMethod(
          ids: ["total"],
          requestType: RequestType.getData,
          function: () async {
            QuerySnapshot products = await firebaseStore.getData("product");
            data.addAll(productFromJson((products.docs.map((e) => e.data() as Map<String, dynamic>? ).toList())));
            QuerySnapshot mainType1 = await firebaseStore.getData("mainType");
            mainType.addAll(productTypeFromJson((mainType1.docs.map((e) => e.data() as Map<String, dynamic>? ).toList())));
            QuerySnapshot products1 = await FirebaseFirestore.instance.collection("mainType").doc("7ZWH3DcV2ytay1IErytK").collection("name").get();
            names.addAll(productNameFromJson((products1.docs.map((e) => e.data() as Map<String, dynamic>? ).toList())));
            print("sssssssssssssssssssssssssssssssssssssssssssssssss ${names[1]}");

            update(['total']);
            return null;
          });
    }catch(e){
    }


  }

}