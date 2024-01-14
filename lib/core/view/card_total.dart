import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CardTotal extends StatelessWidget {

  CardTotal({super.key, required this.color, required this.product,});

  Product product;

  Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: 2.8.w),
      child: Container(
          decoration: BoxDecoration(color: color,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Text("Soap"),
              SizedBox(height: 2.h,),
              Text("55")
            ],
          )
      ),
    );
  }
}