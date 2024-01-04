import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStoreManager{

  FirebaseStoreManager._internal();

  static final FirebaseStoreManager firebaseStoreManager = FirebaseStoreManager._internal();
  late FirebaseFirestore firebaseFirestore ;

  Future<void> init() async {
    firebaseFirestore = FirebaseFirestore.instance;
  }
   Future<void> addData(Map<String , dynamic>? data , String collectionPath) async {
    if(data != null){
    await firebaseFirestore.collection(collectionPath).add(data);}
  }
   Future<void> getData(String collectionPath)async {
    await firebaseFirestore.collection(collectionPath).get();
  }
}