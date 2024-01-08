import 'package:cleanning_store_app/core/view/app_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseStoreManager{

  FirebaseStoreManager._internal();

  static final FirebaseStoreManager firebaseStoreManager = FirebaseStoreManager._internal();
   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance ;

   Future<void> addData({ required Map<String , dynamic>? data ,
    required String collectionPath , String? message , String ?errorMessage}) async {
    if(data != null){
    await firebaseFirestore.collection(collectionPath).add(data)
    .then((value) => AppSnackbar.show( message:message??"dataAdded".tr))
      .catchError((error) =>  AppSnackbar.show( message:"${errorMessage??"FailedToAddData".tr}: $error", error: true));}
  }
   Future<QuerySnapshot> getData(String collectionPath)async {
    return await firebaseFirestore.collection(collectionPath).get();
  }
}