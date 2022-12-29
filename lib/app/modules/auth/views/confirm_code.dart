import 'package:dar_mahaleh/app/controllers/theme_controller.dart';
import 'package:dar_mahaleh/app/data/custom_color.dart';
import 'package:dar_mahaleh/app/modules/auth/controllers/auth_controller.dart';
import 'package:dar_mahaleh/app/modules/auth/views/personal_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../tools/custom_widgets.dart';

class ConfirmCode extends StatefulWidget {
  ConfirmCode({Key? key}) : super(key: key);

  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  TextEditingController txtCode = TextEditingController();
  var keyboardShow = false;
  @override
  Widget build(BuildContext context) {
    keyboardShow = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      backgroundColor: CustomColor.backgroundGreen,
      body: Padding(
        padding: EdgeInsets.only(right: 20, left: 20, top: 150),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextBody(
                  text: 'کد فعال سازی به شماره زیر ارسال گردید',
                  color: Colors.white,
                ),
                SizedBox(
                  height: 40,
                ),
                TextHeader(
                  text: '09032422812',
                  color: Colors.white,
                ),
                SizedBox(
                  height: 40,
                ),
                TextBody(
                  text: 'لطفا کد فعال سازی خود را وارد نمایید',
                  color: Colors.white,
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: PinCodeTextField(
                      textStyle: ThemeController
                          .factory.themeData.value.textTheme.headline1!
                          .copyWith(color: Colors.white),
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        // borderRadius: BorderRadius.circular(5),
                        // fieldHeight: 50,
                        // fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      //backgroundColor: CustomColor.backLight,
                      //enableActiveFill: true,
                      //errorAnimationController: errorController,
                      controller: txtCode,
                      onCompleted: (v) {
                        print("Completed");
                        // Get.lazyPut<AuthController>(
                        //   () => AuthController(),
                        // );
                        Get.to(PersonalView());
                      },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          //currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                      appContext: context,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextBody(
                  text: 'هیچ کدی دریافت نگردید ؟',
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                TextBody(
                  text: 'ارسال مجدد کد',
                  color: Colors.white,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Visibility(
                visible: !keyboardShow,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextBody(
                        text: '00:55',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 100,
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.white,
                            value: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
