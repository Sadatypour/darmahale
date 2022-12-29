import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:dar_mahaleh/app/data/app_theme.dart';
import 'package:dar_mahaleh/app/data/custom_color.dart';
import 'package:dar_mahaleh/tools/pref_util.dart';

class ThemeController extends GetxService {
  static ThemeController factory = Get.find<ThemeController>();
  String themeName = "Default";
  var currentTheme = AppTheme("", null).obs;
  var themeData = ThemeData(
    primarySwatch: Colors.blue,
  ).obs;
  final themeIndex = 0.obs;
  Future<ThemeController> init() async {
    //  configEasyLoading();
    int themeIndexLocal = PreferenceUtils.getInt('themeIndex') ?? 0;
    await setTheme(index: themeIndexLocal);
    return this;
  }

  // @override
  // void onInit() {
  //   buildThemeData();
  //   super.onInit();
  // }
  Future setTheme({int index = 0}) async {
    await PreferenceUtils.setInt('themeIndex', index);
    themeIndex.value = index;
    currentTheme.value = myThemes[index];
    getThemeData();
  }

  void getThemeData() {
    // int index = PreferenceUtils.getInt('themeIndex') ?? 0;

    themeData.value = ThemeData(
        brightness: currentTheme.value.theme?.brightness,
        primarySwatch: currentTheme.value.theme?.primarySwatch,
        primaryColor: currentTheme.value.theme?.primaryColor,
        primaryColorLight: currentTheme.value.theme?.primaryColorLight,
        primaryColorDark: currentTheme.value.theme?.primaryColorDark,
        tabBarTheme: currentTheme.value.theme?.tabBarTheme,
        textTheme: currentTheme.value.theme?.textTheme,
        buttonTheme: currentTheme.value.theme?.buttonThemeData,
        inputDecorationTheme: currentTheme.value.theme?.inputDecorationTheme);
    configEasyLoading();
    Get.changeTheme(themeData.value);
  }

  void configEasyLoading() {
    EasyLoading.instance
      //..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle =
          themeIndex.value == 3 ? EasyLoadingStyle.light : EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = CustomColor.themePrimary
      ..backgroundColor = CustomColor.themePrimary
      ..indicatorColor = CustomColor.themePrimary
      ..textColor = Colors.white
      ..maskColor = Colors.blue.withOpacity(0.5)
      //..userInteractions = true
      ..dismissOnTap = false
      ..customAnimation = CustomAnimation();
  }
}

class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();
  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}
