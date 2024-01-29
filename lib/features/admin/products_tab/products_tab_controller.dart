import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:cleanning_store_app/core/models/product_name.dart';
import 'package:cleanning_store_app/core/models/type_model.dart';
import 'package:cleanning_store_app/core/request_mixin.dart';
import 'package:cleanning_store_app/core/state_mixin.dart';
import 'package:cleanning_store_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
class ProductsTabController extends GetxStateController{
  ProductsTabController({required this.firebaseStore});

  FirebaseStoreManager firebaseStore;

  late List<Product> data ;
  late List<Product> inSData ;
  late List<Product> outSData ;
  late List<Product> inPData ;
  late List<Product> outPData ;
  late List<List<dynamic>> dataList;
  late List<List<dynamic>> dataList1;
  late List<List<dynamic>> dataList2;
  late List<List<dynamic>> dataList3;
  late List<List<dynamic>> dataList4;



  @override
  void onInit() {
    super.onInit();
    data = [];
    inSData=[];
    outSData=[];
    inPData=[];
    outPData=[];
    dataList=[];
    dataList1=[];
    dataList2=[];
    dataList3=[];
    dataList4=[];


    getProduct();

  }

   void getProduct() async {
    try{
      requestMethod(
          ids: ["products"],
          requestType: RequestType.getData,
          function: () async {

            // var mainType1 = await firebaseStore.getData("mainType");
            // mainType.addAll(mainType1.docs.map((e) => e.id));
            // mainType.forEach((element) async{
            //   QuerySnapshot names1 = await FirebaseFirestore.instance.collection("mainType").doc(element).collection("name").get();
            //   names.addAll(names1.docs.map((e) => e.data()));
            //
            // });
            QuerySnapshot products = await firebaseStore.getData("product");
            data.addAll(productFromJson((products.docs.map((e) => e.data() as Map<String, dynamic>? ).toList())));
            data.forEach((element) {
              if(element.inOut=="in"&&element.type=="Finished product")
                inSData.add(element);
            });
            data.forEach((element) {
              if(element.inOut=="out"&&element.type=="Finished product")
                outSData.add(element);
            });
            data.forEach((element) {
              if(element.inOut=="in"&&element.type=="Primary product")
                inPData.add(element);
            });
            data.forEach((element) {
              if(element.inOut=="out"&&element.type=="Primary product")
                outPData.add(element);
            });
            fillData();
            fillDataInS();
            fillDataOutS();
            fillDataInP();
            fillDataOutP();
            update(['products']);
            return null;
          });

    }catch(e){
    }
  

  }


  Future<void> exportCSV() async {
    try {
      final csvData = const ListToCsvConverter().convert(dataList);
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/ss.csv';
      final file = File(filePath);
      await file.writeAsString(csvData);
      await Share.shareXFiles([XFile(filePath)]).then((value) async {
        if (value.status == ShareResultStatus.success) {
          await file.delete();
        }
      });
    }catch(e){}
  }

  Future<void> exportCSVInS() async {
    try {
      final csvData = const ListToCsvConverter().convert(dataList1);
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/ss.csv';
      final file = File(filePath);
      await file.writeAsString(csvData);
      await Share.shareXFiles([XFile(filePath)]).then((value) async {
        if (value.status == ShareResultStatus.success) {
          await file.delete();
        }
      });
    }catch(e){}
  }
  Future<void> exportCSVOutS() async {
    try {
      final csvData = const ListToCsvConverter().convert(dataList2);
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/ss.csv';
      final file = File(filePath);
      await file.writeAsString(csvData);
      await Share.shareXFiles([XFile(filePath)]).then((value) async {
        if (value.status == ShareResultStatus.success) {
          await file.delete();
        }
      });
    }catch(e){}
  }
  Future<void> exportCSVInP() async {
    try {
      final csvData = const ListToCsvConverter().convert(dataList3);
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/ss.csv';
      final file = File(filePath);
      await file.writeAsString(csvData);
      await Share.shareXFiles([XFile(filePath)]).then((value) async {
        if (value.status == ShareResultStatus.success) {
          await file.delete();
        }
      });
    }catch(e){}
  }
  Future<void> exportCSVOutP() async {
    try {
      final csvData = const ListToCsvConverter().convert(dataList4);
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/ss.csv';
      final file = File(filePath);
      await file.writeAsString(csvData);
      await Share.shareXFiles([XFile(filePath)]).then((value) async {
        if (value.status == ShareResultStatus.success) {
          await file.delete();
        }
      });
    }catch(e){}
  }

  fillData(){
    dataList =[["Type","Main Type","name","Quantity","invoiceNumber","Input and output status","Date","Emp Name"],...data.map((pr) => [pr.type, pr.mainType,pr.name,pr.quantity,pr.invoiceNumber,pr.inOut,pr.date,pr.empName]).toList()];
  }
  fillDataInS(){
    dataList1 =[["Type","Main Type","name","Quantity","invoiceNumber","Input and output status","Date","Emp Name"],...inSData.map((pr) => [pr.type, pr.mainType,pr.name,pr.quantity,pr.invoiceNumber,pr.inOut,pr.date,pr.empName]).toList()];
  }
  fillDataOutS(){
    dataList2 =[["Type","Main Type","name","Quantity","invoiceNumber","Input and output statu++s","Date","Emp Name"],...outSData.map((pr) => [pr.type, pr.mainType,pr.name,pr.quantity,pr.invoiceNumber,pr.inOut,pr.date,pr.empName]).toList()];
  }
  fillDataInP(){
    dataList3 =[["Type","Main Type","name","Quantity","invoiceNumber","Input and output status","Date","Emp Name"],...inPData.map((pr) => [pr.type, pr.mainType,pr.name,pr.quantity,pr.invoiceNumber,pr.inOut,pr.date,pr.empName]).toList()];
  }
  fillDataOutP(){
    dataList4 =[["Type","Main Type","name","Quantity","invoiceNumber","Input and output status","Date","Emp Name"],...outPData.map((pr) => [pr.type, pr.mainType,pr.name,pr.quantity,pr.invoiceNumber,pr.inOut,pr.date,pr.empName]).toList()];
  }






}