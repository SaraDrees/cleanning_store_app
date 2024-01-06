import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStoreManager{

  FirebaseStoreManager._internal();

  static final FirebaseStoreManager firebaseStoreManager = FirebaseStoreManager._internal();
   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance ;

   Future<void> addData(Map<String , dynamic>? data , String collectionPath) async {
    if(data != null){
    await firebaseFirestore.collection(collectionPath).add(data);}
  }
   Future<QuerySnapshot> getData(String collectionPath)async {
    return await firebaseFirestore.collection(collectionPath).get();
  }
}