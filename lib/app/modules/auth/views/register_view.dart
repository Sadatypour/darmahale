import 'package:dar_mahaleh/app/controllers/theme_controller.dart';
import 'package:dar_mahaleh/app/modules/auth/views/confirm_code.dart';
import 'package:dar_mahaleh/tools/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/custom_color.dart';

class RegisterView extends StatefulWidget {
  RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController txtMobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundGreen,
      body: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/logo.png',
              //width: 100,
              height: 150,
            ),
            Column(
              children: [
                TextHeader(
                  text: 'لطفا شماره تلفن خود را وارد کنید',
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      controller: txtMobile,
                      decoration: InputDecoration(
                          hintText: 'شماره همراه را وارد کنید',
                          hintStyle: ThemeController
                              .factory.themeData.value.textTheme.bodyText1!
                              .copyWith(color: Colors.white),
                          labelStyle: ThemeController
                              .factory.themeData.value.textTheme.bodyText1!
                              .copyWith(color: Colors.white),
                          focusColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: CustomColor.backLight),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CustomColor.backLight),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          fillColor: CustomColor.backLight)),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 50, left: 50),
                  child: SizedBox(
                    height: 45,
                    child: CustomButton(
                        onTap: () {
                          Get.off(ConfirmCode());
                        },
                        radius: 25,
                        backgroundColor: Colors.white,
                        content: TextHeader2(
                          text: 'ثبت نام',
                          color: CustomColor.backgroundGreen,
                        )),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: EdgeInsets.only(right: 50, left: 50),
            //   child: SizedBox(
            //     height: 45,
            //     child: CustomButton(
            //         onTap: () {
            //           Get.off(ConfirmCode());
            //         },
            //         radius: 20,
            //         backgroundColor: Colors.white,
            //         content: TextHeader2(
            //           text: 'ثبت نام',
            //           color: CustomColor.backgroundGreen,
            //         )),
            //   ),
            // ),
            Column(
              children: [
                TextButton(
                    onPressed: () {},
                    child: TextBody(
                      text: 'قبلا حساب داشته اید ؟ ورود',
                      color: Colors.white,
                    )),
                TextButton(
                    onPressed: () {},
                    child: TextBody(
                      text: 'ورود به صورت مهمان',
                      color: Colors.white,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
