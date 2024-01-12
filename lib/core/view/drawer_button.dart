import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../routing/routes.dart';

class MyDrawerButton extends StatelessWidget {

  MyDrawerButton({required this.t, required this.f, required this.c});

  late String t;
  late String f;
  late IconData c;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: InkWell(
        onTap: (){
          Get.offAndToNamed(f);
        },
        child: Row(
          children: [
            SizedBox(width: 20,),
            Icon(c),
            SizedBox(width: 50,),
            Text("Add")
          ],
        ),
      ),
    );
  }


}
