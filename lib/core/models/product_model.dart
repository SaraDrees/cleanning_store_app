
import 'dart:convert';

//Product productFromJson(String str) => Product.fromJson(json.decode(str));
List<Product> productFromJson(List str) => List<Product>.from(str.map((x) => Product.fromJson(x)));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    String type;
    String inOut;
    String name;
    String mainType;
    int invoiceNumber;
    int quantity;
    String date;
    String empName;

    Product({
        required this.date,
        required this.inOut,
        required this.type,
        required this.name,
        required this.mainType,
        required this.invoiceNumber,
        required this.quantity,
        required this.empName
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"]??"",
        mainType: json["mainType"]??"",
        invoiceNumber: json["invoiceNumber"]??0,
        quantity: json["quantity"]??0,
        inOut: json["inOut"]??"",
        type: json["type"]??"",
        date: json["date"]??"",
        empName: json["empName"]
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "inOut": inOut,
        "name": name,
        "mainType": mainType,
        "invoiceNumber": invoiceNumber,
        "quantity": quantity,
        "date": date,
        "empName": empName
    };
}
