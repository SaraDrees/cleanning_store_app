import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:cleanning_store_app/core/models/product_name.dart';
import 'package:cleanning_store_app/core/request_mixin.dart';
import 'package:cleanning_store_app/core/state_mixin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/models/type_model.dart';

class TotalController extends GetxStateController{
  TotalController({required this.firebaseStore});

  FirebaseStoreManager firebaseStore;

  late List<Product> data ;
  late List mainType;
  late List names;
  late List <ProductName> productName;
  var totalIn=0;
  var i=0;
  var totalOut=0;
  Map<String,dynamic> s={};

  @override
  void onInit() {
    super.onInit();
    data = [];
    mainType=[];
    names=[];
    productName=[];
    getProductt();
  }

  void getProductt() async {
    try{
      requestMethod(
          ids: ["total"],
          requestType: RequestType.getData,
          function: () async {
            QuerySnapshot products = await firebaseStore.getData("product");
            data.addAll(productFromJson((products.docs.map((e) => e.data() as Map<String, dynamic>? ).toList())));
            var mainType1 = await firebaseStore.getData("mainType");
            mainType.addAll(mainType1.docs.map((e) => e.id));
            mainType.forEach((element) async{
              QuerySnapshot names1 = await FirebaseFirestore.instance.collection("mainType").doc(element).collection("name").get();
              names.addAll(names1.docs.map((e) => e.data()));
            });
            print("sssssssssssssssssssssssssssssssssssssssssssssss ${names}");
            // names.forEach((n) {
            //   data.forEach((d) {
            //     if(n['name']==d.name&&d.inOut=="in")
            //       {
            //         totalIn+=d.quantity;
            //       }
            //     if(n['name']==d.name&&d.inOut=="out")
            //     {
            //       totalOut+=d.quantity;
            //     }
            //   });
            //   print("sssssssssssssssssssssssssssssssssssssssssssssss ${names[i]['name']}");
            //   i++;
            //   s.addAll({"name":n,"total":totalIn-totalOut});
            //   //productName.add(ProductName.fromJson(s));
            //   totalIn=0;
            //   totalOut=0;
            // });

            update(['total']);
            return null;
          });
    }catch(e){
    }


  }

}