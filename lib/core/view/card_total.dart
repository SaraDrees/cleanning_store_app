import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:cleanning_store_app/core/models/product_name.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CardTotal extends StatelessWidget {

  CardTotal({super.key,});

  //ProductName product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: 2.8.w),
      child: Container(
          decoration: BoxDecoration(color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Text("dwqd"),
              SizedBox(height: 2.h,),
              Text("433")
            ],
          )
      ),
    );
  }
}