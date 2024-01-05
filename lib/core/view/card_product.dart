import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {

  CardProduct({required this.name,required this.mainType,required this.productType,required this.price,
    required this.quantity});

  String name;
  String mainType;
  String productType;
  int price;
  int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      height: MediaQuery.of(context).size.width*0.2,
      color: Colors.grey,
      child: Row(
        children: [
          Column(
            children: [
              Text("$name"),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("$mainType"),
                  SizedBox(width: 20,),
                  Text("$productType"),
                ],
              )
            ],
          ),
          Column(
            children: [
              Text("$price"),
              SizedBox(height: 10,),
              Text("$quantity"),
            ],
          )
        ],
      ),
    );

  }

}
