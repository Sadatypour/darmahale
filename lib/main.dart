import 'package:dar_mahaleh/app/data/custom_color.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import 'app/controllers/theme_controller.dart';
import 'app/modules/auth/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';
import 'tools/pref_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerServices();
  //change statusbar color
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: CustomColor.backgroundGreen));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(DevicePreview(
      enabled: false,
      builder: (context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          title: "در محله",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          locale: const Locale(
              'fa', 'IR'), // translations will be displayed in that locale
          theme: Get.find<ThemeController>().themeData.value,
          fallbackLocale: const Locale('fa', 'IR'),
          builder: EasyLoading.init(),
        ),
      ),
    ));
  });
}

Future registerServices() async {
  await PreferenceUtils.init();
  await Get.putAsync(() => ThemeController().init());
  Get.lazyPut<AuthController>(
    () => AuthController(),
  );
  // await PreferenceUtils.remove(Preferences.userId);
  // await PreferenceUtils.remove(Preferences.phoneConfirmed);
  // await PreferenceUtils.remove(Preferences.phoneNumber);
}
