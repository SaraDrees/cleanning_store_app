
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductName {
  String name;
  int total;
  // String type;

  ProductName({
    required this.total,
    required this.name,
    // required this.type
  });

  factory ProductName.fromJson(Map<String, dynamic> snapshot) => ProductName(
    name: snapshot['name']??"",
    total: snapshot['total']
    // type: json['type']
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "total":total
    // 'type' : type
  };
}

List <ProductName> productNameFromJson(List str) => List <ProductName>.from(str.map((x) => ProductName.fromJson(x)));

String productNameToJson(ProductName data) => json.encode(data.toJson());
