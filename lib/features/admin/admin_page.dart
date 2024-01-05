import 'package:cleanning_store_app/features/admin/widget/tap1.dart';
import 'package:flutter/material.dart';
import 'package:cleanning_store_app/features/admin/admin_controller.dart';
import 'package:get/get.dart';



class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: GetBuilder<AdminController>(
          id: 'n',
          builder: (c){
            return Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    ProductsPage(product: c.data)
                  ],
                ),
              ),
            );
          }


        ));
  }
}
