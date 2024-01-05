import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:cleanning_store_app/core/view/card_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {

  List<Product> data;
  @override
  State<ProductsPage> createState() => _ProductsPageState(data: data);

  ProductsPage({required this.data});
}

class _ProductsPageState extends State<ProductsPage> {

  List<Product> data;

  _ProductsPageState({required this.data});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getData();
  }

  // getData()async{
  //   QuerySnapshot products = await FirebaseFirestore.instance.collection("product").get();
  //   data.addAll(products.docs);
  //   setState(() {
  //
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.separated(
          separatorBuilder: (c,i){
            return Container(
              height: 30,
            );
          },
          itemCount: data.length,
            itemBuilder: (context,i){
              return CardProduct(name: data[i].name,mainType: data[i].mainType,productType: data[i].productType,price: data[i].price,quantity: data[i].quantity,);
        })
      ),
    );
  }
}
