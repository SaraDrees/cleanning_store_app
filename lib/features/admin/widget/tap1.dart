import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:cleanning_store_app/core/view/card_product.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {

  List product;
  @override
  State<ProductsPage> createState() => _ProductsPageState();

  ProductsPage({required this.product});
}

class _ProductsPageState extends State<ProductsPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        child: ListView.builder(
          itemCount: widget.product.length,
            itemBuilder: (context,i){
          return CardProduct(name: widget.product[i]["name"],mainType: widget.product[i]["mainType"],productType: widget.product[i]["productType"],price: widget.product[i]["price"],quantity: widget.product[i]["quantity"],);
        })
      ),
    );
  }
}
