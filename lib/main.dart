import 'package:cleanning_store_app/app_initial_binding.dart';
import 'package:cleanning_store_app/core/constant.dart';
import 'package:cleanning_store_app/core/routing/routes.dart';
import 'package:cleanning_store_app/core/theme_manager.dart';
import 'package:cleanning_store_app/core/translation.dart';
import 'package:cleanning_store_app/features/admin/add_type_tab/add_type_tab_binding.dart';
import 'package:cleanning_store_app/features/admin/admin_page.dart';
import 'package:cleanning_store_app/features/admin/total/total_view.dart';
import 'package:cleanning_store_app/features/home/home_binding.dart';
import 'package:cleanning_store_app/features/home/home_page.dart';
import 'package:cleanning_store_app/features/login/login_binding.dart';
import 'package:cleanning_store_app/features/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'features/admin/add_type_tab/add_type_tab_view.dart';
import 'features/admin/add_user_tab/add_user_tab_binding.dart';
import 'features/admin/add_user_tab/add_user_tab_view.dart';
import 'features/admin/admin_binding.dart';
import 'features/admin/products_tab/primary_product/admin_primary.dart';
import 'features/admin/products_tab/primary_product/product_primary.dart';

part 'package:cleanning_store_app/core/routing/app_pages.dart';

void main() async {

  await preInitializations();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: Constant.appName,
        translations: Translation(), // your translations
        locale: const Locale(
            'en', 'US'), // translations will be displayed in that locale
        fallbackLocale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        initialRoute: AppRoutes.loginPageRoute,
        getPages: _AppPages.appPages,
        initialBinding: AppInitialBinding(),
      );
    });
  }
}

Future preInitializations() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
