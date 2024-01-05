
import 'dart:convert';

//Product productFromJson(String str) => Product.fromJson(json.decode(str));
List<Product> productFromJson(List str) => List<Product>.from(str.map((x) => Product.fromJson(x)));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    String name;
    String mainType;
    String productType;
    int price;
    int quantity;

    Product({
        required this.name,
        required this.mainType,
        required this.productType,
        required this.price,
        required this.quantity,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        mainType: json["mainType"],
        productType: json["productType"],
        price: json["price"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "mainType": mainType,
        "productType": productType,
        "price": price,
        "quantity": quantity,
    };
}
