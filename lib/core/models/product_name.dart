
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductName {
  String ?id ;
  String name;
  // String type;

  ProductName({
    this.id,
    required this.name,
    // required this.type

  });

  factory ProductName.fromJson(QueryDocumentSnapshot snapshot) => ProductName(
    id: snapshot.reference.id,
    name: snapshot['name']??"",
    // type: json['type']
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    // 'type' : type
  };
}

List <ProductName> productNameFromJson(List str) => List <ProductName>.from(str.map((x) => ProductName.fromJson(x)));

String productNameToJson(ProductName data) => json.encode(data.toJson());
