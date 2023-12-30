
part of 'package:cleanning_store_app/main.dart';

class _AppPages {
  _AppPages._();

  static List<GetPage> appPages = [
    GetPage(
      name: AppRoutes.loginPageRoute,
      page: () => LoginPage(),
      binding: LoginBinding(),
    )
  ];
}