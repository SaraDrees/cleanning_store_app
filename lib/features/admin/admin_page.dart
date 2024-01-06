import 'package:cleanning_store_app/features/admin/products_tab/products_tab_view.dart';
import 'package:flutter/material.dart';



class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> with TickerProviderStateMixin {
 
 late TabController tabController ;

 @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      child: Text("Products"),
                    ),
                    Tab(
                      child: Text("Add User"),
                    ),
                    Tab(
                      child: Text("Add Type"),
                    )
                  ],
                ),

              ),
              body:  TabBarView(
                controller: tabController,
                    children: const [
                      ProductsTabView(),
                      Center(child: Text("Add User")),
                      Center(child: Text("Add Type"))
                    ],
                //   );
                // }
              ),


        ));
  }
}
