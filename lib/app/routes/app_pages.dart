import 'package:get/get.dart';
import 'package:myapp/app/modules/admin/bindings/admin_binding.dart';
import 'package:myapp/app/modules/admin/views/admin_view.dart';
import 'package:myapp/app/modules/detail_unsur/hidrogen/bindings/hidrogen_binding.dart';
import 'package:myapp/app/modules/detail_unsur/hidrogen/views/hidrogen_view.dart';
import 'package:myapp/app/modules/login/bindings/login_binding.dart';
import 'package:myapp/app/modules/login/views/login_view.dart';
import 'package:myapp/app/modules/register/bindings/register_binding.dart';
import 'package:myapp/app/modules/register/views/register_view.dart';
import 'package:myapp/app/modules/search/views/search_explore_view.dart';
import 'package:myapp/app/modules/setting/bindings/settings_binding.dart';
import 'package:myapp/app/modules/setting/views/settings_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.REGISTER;

  static final routes = [
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHEXPLORE,
      page: () => const SearchExploreView(),
    ),
   GetPage(
      name: _Paths.HIDROGEN,
      page: () => HidrogenView(),
      binding: HidrogenBinding(),
      transition: Transition.cupertino, // Optional: Add a transition effect
      arguments: {
        // Default arguments (if needed)
        'symbol': 'H',
        'elementName': 'Hydrogen',
        'atomicNumber': 1,
        'atomicWeight': '1.008',
        'configuration': '1s1',
        'group': '1',
        'period': '1',
      },
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => const AdminDashboardView(),
      binding: AdminDashboardBinding(),
    ),
  ];
}
