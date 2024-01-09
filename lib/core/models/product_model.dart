
import 'dart:convert';

//Product productFromJson(String str) => Product.fromJson(json.decode(str));
List<Product> productFromJson(List str) => List<Product>.from(str.map((x) => Product.fromJson(x)));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    String name;
    String mainType;
    String subType;
    int price;
    int quantity;

    Product({
        required this.name,
        required this.mainType,
        required this.subType,
        required this.price,
        required this.quantity,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        mainType: json["mainType"],
        subType: json["subType"],
        price: json["price"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "mainType": mainType,
        "subType": subType,
        "price": price,
        "quantity": quantity,
    };
}
