
part of 'package:cleanning_store_app/main.dart';

class _AppPages {
  _AppPages._();

  static List<GetPage> appPages = [
    GetPage(
      name: AppRoutes.loginPageRoute,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.homePageRoute,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.adminPageRoute,
      page: () => AdminPage(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: AppRoutes.addUser,
      page: () => AddUserTabView(),
      binding: AdminBinding(),
    )
  ];
}