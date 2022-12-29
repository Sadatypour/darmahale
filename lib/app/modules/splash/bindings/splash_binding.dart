import 'package:dar_mahaleh/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
    // Get.lazyPut<AuthController>(
    //   () => AuthController(),
    // );
  }
}
