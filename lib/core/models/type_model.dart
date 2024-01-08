
import 'dart:convert';

class productType {
  String ?id ;
  String name;
  // String type;

  productType({
    this.id,
    required this.name,
    // required this.type

  });

  factory productType.fromJson(Map<String, dynamic> json) => productType(
    id: json['_id'],
    name: json["name"],
    // type: json['type']
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    // 'type' : type
  };
}

List <productType> productTypeFromJson(List str) => List <productType>.from(str.map((x) => productType.fromJson(x)));

String productTypeToJson(productType data) => json.encode(data.toJson());
