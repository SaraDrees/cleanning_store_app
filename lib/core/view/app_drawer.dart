
import 'package:cleanning_store_app/core/routing/routes.dart';
import 'package:cleanning_store_app/core/view/menu_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                  height: 15.h,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 2.h, start: 6.w),
                    child: Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text(
                    "menu".tr,
                    style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
                          )),
                    ),
                  ),
                  drawerWidget()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  drawerWidget() {
    return  Container(
          constraints: BoxConstraints(
            maxHeight: SizerUtil.height-15.h
          ),
          child: Column(
            children: [
                MenuItemWidget(
                  title: "storPage".tr,
                  iconData: Icons.store,
                  index: 0,
                  onClick: () {
                    Get.currentRoute == AppRoutes.adminPageRoute? null :
                    Get.offAndToNamed(AppRoutes.adminPageRoute);
                  }),
              MenuItemWidget(
                  title: "primaryPage".tr,
                  iconData: Icons.add_card_outlined,
                  index: 0,
                  onClick: () {
                    Get.currentRoute == AppRoutes.adminPrimaryRoute? null :
                    Get.offAndToNamed(AppRoutes.adminPrimaryRoute);
                  }),
                  MenuItemWidget(
                  title: "addType".tr,
                  iconData: Icons.account_tree_rounded,
                  index: 0,
                  onClick: () {
                    Get.currentRoute == AppRoutes.addProduct? null :
                    Get.offAndToNamed(AppRoutes.addProduct);
                  }),
              MenuItemWidget(
                  title: "addUser".tr,
                  iconData: Icons.person_add,
                  index: 0,
                  onClick: () {
                    Get.currentRoute == AppRoutes.addUser? null :
                    Get.offAndToNamed(AppRoutes.addUser);
                  }),

               
              const Expanded(child: SizedBox() ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:3.h),
                child: const Divider(color: Colors.white, thickness: 1.5),
              ),
              MenuItemWidget(
                  title: "signOut".tr,
                  iconData: Icons.logout,
                  onClick: () async {
                    Get.offAndToNamed(AppRoutes.loginPageRoute);
                  }),
              SizedBox(
                height: 1.5.h,
              )
            ],
          ),
        );
  }

}
