import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:cleanning_store_app/core/models/product_name.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CardTotal extends StatelessWidget {

  CardTotal({super.key,required this.product});

  Map<String,dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,

      color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: 2.8.w),
      child: Container(
          decoration: BoxDecoration(color: product["total"]==0?Colors.grey:Colors.black54,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text("${product["name"]}",style: TextStyle(fontSize: 20,color: Colors.white,),textAlign: TextAlign.center,)),
                SizedBox(height: 2.h,),
                Text("${product["total"]}",style: TextStyle(fontSize: 20,color: product["total"]==0?Colors.deepOrange:Colors.greenAccent))
              ],
            ),
          )
      ),
    );
  }
}