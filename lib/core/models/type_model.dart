
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class productType {
  String ?id ;
  String name;
  // String type;

  productType({
    this.id,
    required this.name,
    // required this.type

  });

  factory productType.fromJson(QueryDocumentSnapshot snapshot) => productType(
    id: snapshot.reference.id,
    name: snapshot['name']??"",
    // type: json['type']
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    // 'type' : type
  };
}

List <productType> productTypeFromJson(List str) => List <productType>.from(str.map((x) => productType.fromJson(x)));

String productTypeToJson(productType data) => json.encode(data.toJson());
