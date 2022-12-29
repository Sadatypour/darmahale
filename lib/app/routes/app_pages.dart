import 'package:get/get.dart';

import 'package:dar_mahaleh/app/modules/add_product/bindings/add_product_binding.dart';
import 'package:dar_mahaleh/app/modules/add_product/views/add_product_view.dart';
import 'package:dar_mahaleh/app/modules/auth/bindings/auth_binding.dart';
import 'package:dar_mahaleh/app/modules/auth/views/register_view.dart';
import 'package:dar_mahaleh/app/modules/category/bindings/category_binding.dart';
import 'package:dar_mahaleh/app/modules/category/views/category_view.dart';
import 'package:dar_mahaleh/app/modules/home/bindings/home_binding.dart';
import 'package:dar_mahaleh/app/modules/home/views/home_view.dart';
import 'package:dar_mahaleh/app/modules/map/bindings/map_binding.dart';
import 'package:dar_mahaleh/app/modules/map/views/map_view.dart';
import 'package:dar_mahaleh/app/modules/more/bindings/more_binding.dart';
import 'package:dar_mahaleh/app/modules/more/views/more_view.dart';
import 'package:dar_mahaleh/app/modules/notification/bindings/notification_binding.dart';
import 'package:dar_mahaleh/app/modules/notification/views/notification_view.dart';
import 'package:dar_mahaleh/app/modules/splash/bindings/splash_binding.dart';
import 'package:dar_mahaleh/app/modules/splash/views/splash_view.dart';
import 'package:dar_mahaleh/app/modules/user/bindings/user_binding.dart';
import 'package:dar_mahaleh/app/modules/user/views/user_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => RegisterView(),
      binding: AuthBinding(),
    ),
    // GetPage(
    //   name: _Paths.USER,
    //   page: () => UserView(userId: null,),
    //   binding: UserBinding(),
    // ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.MORE,
      page: () => MoreView(),
      binding: MoreBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.MAP,
      page: () => MapView(),
      binding: MapBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
  ];
}
