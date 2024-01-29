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
  var totalOut=0;
  var totalInP=0;
  var totalOutP=0;
  var h1=false;
  var h2=false;
  List<Map<String,dynamic>> s=[];
  List<Map<String,dynamic>> p=[];

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


            for(int i=0;i<mainType.length;i++)
              {
                QuerySnapshot names1 = await FirebaseFirestore.instance.collection("mainType").doc(mainType[i]).collection("name").get();
                names.addAll(names1.docs.map((e) => e.data()));

              }
            print("sssssssssssssssssssssssssssssssssssssssssssssss ${names}");
            print("sssssssssssssssssssssssssssssssssssssssssssssss ${data}");

            for(var i in names)
              {
                for(var j in data)
                  {
                    if(i["name"]==j.name && j.inOut=="in"&&j.type=="Finished product"){
                      h1=true;
                      totalIn+=j.quantity;
                    }
                    if(i["name"]==j.name && j.inOut=="out"&&j.type=="Finished product"){
                      h1=true;
                      totalOut+=j.quantity;
                    }

                    if(i["name"]==j.name && j.inOut=="in"&&j.type=="Primary product")
                      {
                        h2=true;
                        totalInP+=j.quantity;
                      }

                    if(i["name"]==j.name && j.inOut=="out"&&j.type=="Primary product"){
                      h2=true;
                      totalOutP+=j.quantity;
                    }

                  }
                if(h1)
                s.addAll([{"name":i['name'],"total":totalIn-totalOut}]);
                if(h2)
                p.addAll([{"name":i['name'],"total":totalInP-totalOutP}]);
                totalOut=0;
                totalIn=0;
                totalOutP=0;
                totalInP=0;
                h1=false;
                h2=false;
                print("sssssssssssssssssssssssssssssssssssssssssssssss ${s}");
              }

            update(['total']);
            return null;
          });
    }catch(e){
    }


  }

}