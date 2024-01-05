import 'package:cleanning_store_app/app_initial_binding.dart';
import 'package:cleanning_store_app/core/constant.dart';
import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/routing/routes.dart';
import 'package:cleanning_store_app/core/theme_manager.dart';
import 'package:cleanning_store_app/core/translation.dart';
import 'package:cleanning_store_app/features/admin/admin_page.dart';
import 'package:cleanning_store_app/features/home/home_binding.dart';
import 'package:cleanning_store_app/features/home/home_page.dart';
import 'package:cleanning_store_app/features/login/login_binding.dart';
import 'package:cleanning_store_app/features/login/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'features/admin/admin_binding.dart';

part 'package:cleanning_store_app/core/routing/app_pages.dart';

void main() async {

  await preInitializations();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
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
  FirebaseStoreManager.firebaseStoreManager.init();
}
