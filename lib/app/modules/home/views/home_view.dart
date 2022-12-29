import 'package:dar_mahaleh/app/modules/add_product/views/add_product_view.dart';
import 'package:dar_mahaleh/app/modules/auth/views/register_view.dart';
import 'package:dar_mahaleh/app/modules/category/views/category_view.dart';

import 'package:dar_mahaleh/app/modules/home/views/main_view.dart';
import 'package:dar_mahaleh/app/modules/more/views/more_view.dart';
import 'package:dar_mahaleh/app/modules/notification/views/notification_view.dart';
import 'package:dar_mahaleh/app/modules/splash/views/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../controllers/theme_controller.dart';
import '../../../data/custom_color.dart';
import '../controllers/home_controller.dart';

final PersistentTabController bottomSheetcontroller =
    PersistentTabController(initialIndex: 0);

class HomeView extends GetView<HomeController> {
  ThemeController get theme => ThemeController.factory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PersistentTabView(
      context,
      navBarHeight: kBottomNavigationBarHeight + 10,
      controller: bottomSheetcontroller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      //confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      // decoration: NavBarDecoration(
      //   borderRadius: BorderRadius.circular(10.0),
      //   colorBehindNavBar: Colors.red,
      // ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: false,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    ));
  }

  List<Widget> _buildScreens() {
    return [
      MainView(),
      //  MainInfinitView(),
      CategoryView(),
      AddProductView(),
      NotificationView(),
      MoreView()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        textStyle: theme.currentTheme.value.theme!.textTheme!.headline5,
        iconSize: 22,
        contentPadding: 10,
        icon: Icon(Icons.home),
        title: "خانه",
        activeColorPrimary: CustomColor.backgroundGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        textStyle: theme.currentTheme.value.theme!.textTheme!.headline5,
        iconSize: 22,
        contentPadding: 20,
        icon: Icon(CupertinoIcons.list_bullet),
        title: "گروه ها",
        activeColorPrimary: CustomColor.backgroundGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        textStyle: theme.currentTheme.value.theme!.textTheme!.headline5,
        iconSize: 22,
        contentPadding: 20,
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        title: "یادداشت",
        activeColorPrimary: CustomColor.backgroundGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        textStyle: theme.currentTheme.value.theme!.textTheme!.headline5,
        iconSize: 22,
        contentPadding: 20,
        icon: Icon(Icons.notifications),
        title: "اعلان ها",
        activeColorPrimary: CustomColor.backgroundGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        textStyle: theme.currentTheme.value.theme!.textTheme!.headline5,
        iconSize: 22,
        contentPadding: 20,
        icon: Icon(Icons.more_vert),
        title: "بیشتر",
        activeColorPrimary: CustomColor.backgroundGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
