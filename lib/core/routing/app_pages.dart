
part of 'package:cleanning_store_app/main.dart';

class _AppPages {
  _AppPages._();

  static List<GetPage> appPages = [
    GetPage(
      name: AppRoutes.loginPageRoute,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400)
    ),
    GetPage(
      name: AppRoutes.homePageRoute,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
      name: AppRoutes.adminPageRoute,
      page: () => const AdminPage(),
      binding: AdminBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
      name: AppRoutes.addUser,
      page: () => AddUserTabView(),
      binding: AdminBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: AppRoutes.adminPrimaryRoute,
        page: () => AdminPrimary(),
        binding: AdminBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: AppRoutes.addProduct,
        page: () => AddTypeView(),
        binding: AddTypeBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: AppRoutes.totalRoute,
        page: () => TotalView(),
        binding: AdminBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)
    )
  ];
}