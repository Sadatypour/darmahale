import 'package:dar_mahaleh/app/data/custom_color.dart';
import 'package:dar_mahaleh/app/modules/auth/views/register_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../tools/custom_widgets.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  Size size = Size.zero;
  late AnimationController _controller;
  late StaggeredRaindropAnimation _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = StaggeredRaindropAnimation(_controller);
    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });
    Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      Get.off(RegisterView());
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_animation.textOpacity.value);
    return Scaffold(
      backgroundColor: CustomColor.backgroundGreen,
      body: Stack(
        children: [
          Center(
              //     child: Image.asset(
              //   'assets/images/logo.png',
              //   scale: _animation.textOpacity.value,
              // )
              child: ScaleTransition(
            scale: _animation.scaleValue,
            child: Image.asset('assets/images/logo.png'),
          )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextHeader(
                      text: 'شرکت توسعه ',
                      color: Colors.white,
                    ),
                    TextHeader(
                      text: 'ترقی ',
                      color: Colors.black,
                    ),
                    TextHeader(
                      text: 'داده های محلی',
                      color: Colors.white,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
